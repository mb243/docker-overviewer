FROM ubuntu:16.04

ENV REV 1.12.2

RUN apt-get update && \
    apt-get -y install \
      apt-transport-https \
      curl \
      python  \
      sudo \
      wget

ADD ./overviewer/ /overviewer/

RUN chmod +x /overviewer/overviewer.sh && \
    echo "deb https://overviewer.org/debian ./" >> /etc/apt/sources.list && \
    wget -O - https://overviewer.org/debian/overviewer.gpg.asc | sudo apt-key add - && \
    apt-get update && \
    apt-get -y install minecraft-overviewer && \
    mkdir -p ~/.minecraft/versions/${REV}/ && \
    curl -o ~/.minecraft/versions/${REV}/${REV}.jar -L \
      https://s3.amazonaws.com/Minecraft.Download/versions/${REV}/${REV}.jar

VOLUME /overviewer/

ENTRYPOINT ["/overviewer/overviewer.sh"]
