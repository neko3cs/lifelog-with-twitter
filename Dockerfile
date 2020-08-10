FROM node:lts-alpine AS llwt-app
LABEL maintainer="neko3cs (https://github.com/neko3cs)"

ARG ANGULAR_VERSION="10.0.0"

WORKDIR /root

RUN apk update && \
    apk upgrade && \
    apk add --no-cache zsh git curl vim chromium && \
    curl -fsSL https://raw.githubusercontent.com/neko3cs/.dotfiles/master/.zshrc > $HOME/.zshrc && \
    mkdir .zsh/ && \
    mkdir .zsh/zsh-completions/ && \
    git clone git://github.com/zsh-users/zsh-completions.git $HOME/.zsh/zsh-completions/ && \
    echo -e '\n#zsh-completions\nfpath=($HOME/.zsh/zsh-completions/src $fpath)\n' >> $HOME/.zshrc && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/neko3cs/.dotfiles/master/vim-install.sh)" && \
    curl -fsSL https://raw.githubusercontent.com/neko3cs/.dotfiles/master/.vimrc > $HOME/.vimrc && \
    npm install --global @angular/cli@${ANGULAR_VERSION}

VOLUME [ "/usr/src" ]

WORKDIR /usr/src

EXPOSE 4200
