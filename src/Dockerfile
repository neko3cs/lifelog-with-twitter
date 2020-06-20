FROM node:lts-alpine AS lifelog-with-twitter
LABEL maintainer="neko3cs"

ARG ANGULAR_VERSION="latest"

WORKDIR /usr/src/

RUN apk update && \
    apk upgrade && \
    npm install --global @angular/cli@${ANGULAR_VERSION}

EXPOSE 80
