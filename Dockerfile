FROM alpine
MAINTAINER tanmx <tanmingxiao@gmail.com>

RUN set -ex \
        && apk update && apk upgrade \
        && apk add --no-cache tzdata git python3 py3-setuptools \
        && pip3 install --upgrade pip \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone \
        && rm -rf /var/cache/apk/*

RUN git clone https://github.com/tanmx/Telegram-Name-Updating.git /Telegram-Name-Updating \
        && cd /Telegram-Name-Updating \
        && mkdir logs \
        && pip3 install -r requirements.txt \
        && rm -rf ~/.cache/pip

WORKDIR /Telegram-Name-Updating
CMD nohup python3 tg_username_update.py >> /Telegram-Name-Updating/logs/tg_username_update.log 2>&1 &
