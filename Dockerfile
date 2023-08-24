FROM debian:latest

RUN apt update
RUN apt install curl build-essential git python3 python3-pip -y

SHELL ["/bin/bash", "--login", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

WORKDIR /app/modmailbot
ARG GIT_REPO=https://github.com/Dragory/modmailbot.git
RUN git clone $GIT_REPO .
ARG GIT_BRANCH=master
RUN git switch $GIT_BRANCH

RUN nvm install

WORKDIR /app/modmailbot
RUN npm i

ARG MM_TOKEN
ARG MM_PREFIX
ARG MM_MAIN_SERVER_ID
ARG MM_INBOX_SERVER_ID
ARG MM_LOG_CHANNEL_ID

ENTRYPOINT ["/bin/bash", "--login", "-c", "npm start"]
