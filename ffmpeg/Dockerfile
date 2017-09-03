FROM ubuntu:14.04
MAINTAINER flny flny@example.com

RUN apt-get update && apt-get install -y \
      wget \
      xz-utils

WORKDIR /tmp

RUN wget http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz \
      && tar Jxvf ./ffmpeg-release-64bit-static.tar.xz \
      && cp ./ffmpeg*64bit-static/ffmpeg /usr/local/bin/

CMD /bin/bash
