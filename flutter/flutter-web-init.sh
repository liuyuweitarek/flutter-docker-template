#!/usr/bin/env bash

cd ${FLUTTER_WEB_VOLUME}
if [ -e ./${APPLICATION_NAME} ]; then
    rm -rf ${APPLICATION_NAME}
fi

if [ -z $FLUTTER_WEB_GIT_REPOSITORY ]; then
    flutter create ${APPLICATION_NAME}
else
    git clone https://github.com/${FLUTTER_WEB_GIT_REPOSITORY}.git
fi

bash /usr/local/script/flutter-web-build.sh
cd -

exit 0