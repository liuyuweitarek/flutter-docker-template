#!/usr/bin/env bash

APP_DIR="${FLUTTER_WEB_VOLUME}/${APPLICATION_NAME}/web"
if [ -d $APP_DIR ]; then
    cd ${FLUTTER_WEB_VOLUME}/${APPLICATION_NAME}
    flutter pub get
    flutter build web
    chmod 755 -R *
    cd -
    exit 0
else
    echo "${APP_DIR}: No such directory"
    exit 1
fi