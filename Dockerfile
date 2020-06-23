FROM node:lts-alpine AS llwt-app
LABEL maintainer="neko3cs (https://github.com/neko3cs)"

ARG ANGULAR_VERSION="latest"

WORKDIR /usr/src

RUN apk update && \
    apk upgrade && \
    npm init --yes && \
    npm install --global @angular/cli@${ANGULAR_VERSION}

VOLUME [ "/usr/src" ]

EXPOSE 4200
