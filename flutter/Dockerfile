FROM ubuntu:22.04

RUN apt update && \
    apt -y install curl && \
    apt -y install file && \
    apt -y install unzip && \
    apt -y install git && \
    apt -y install xz-utils && \
    apt -y install zip && \
    apt -y install git && \
    apt -y install wget

RUN mkdir -p /usr/local/script &
COPY ./flutter-web-init.sh /usr/local/script/
COPY ./flutter-web-build.sh /usr/local/script/
RUN chmod a+x /usr/local/script/flutter-web-init.sh
RUN chmod a+x /usr/local/script/flutter-web-build.sh

# Settings for Flutter
ENV FLUTTER_HOME /opt/flutter
ENV FLUTTER_WEB_VOLUME /usr/src

RUN mkdir -p $FLUTTER_HOME && \
    git clone https://github.com/flutter/flutter.git $FLUTTER_HOME

ENV PATH $PATH:$FLUTTER_HOME/bin

RUN $FLUTTER_HOME/bin/flutter channel beta && \
    $FLUTTER_HOME/bin/flutter config --enable-web && \
    $FLUTTER_HOME/bin/flutter upgrade && \
    $FLUTTER_HOME/bin/flutter pub global activate webdev

ENV PATH $PATH:/root/.pub-cache/bin