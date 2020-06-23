FROM node:lts-alpine AS llwt-app
LABEL maintainer="neko3cs (https://github.com/neko3cs)"

ARG ANGULAR_VERSION="latest"

WORKDIR /root

RUN apk update && \
    apk upgrade && \
    apk add --no-cache zsh git curl vim && \
    curl -fsSL https://raw.githubusercontent.com/neko3cs/.dotfiles/master/.zshrc > .zshrc && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/neko3cs/.dotfiles/master/vim-install.sh)" && \
    curl -fsSL https://raw.githubusercontent.com/neko3cs/.dotfiles/master/.vimrc > .vimrc && \
    npm install --global @angular/cli@${ANGULAR_VERSION}

VOLUME [ "/usr/src" ]

WORKDIR /usr/src

RUN npm init --yes

EXPOSE 4200
