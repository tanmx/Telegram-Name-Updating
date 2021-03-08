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
        && cd /Telegram-Name-Updating && mkdir logs \
        && pip3 install -r requirements.txt \
        && rm -rf ~/.cache/pip

RUN cp /Telegram-Name-Updating/docker_entrypoint.sh /usr/local/bin \
        && chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /Telegram-Name-Updating
ENTRYPOINT ["docker_entrypoint.sh"]
