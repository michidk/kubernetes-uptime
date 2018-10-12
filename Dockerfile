FROM alpine

VOLUME /opt/uptime-config/

RUN apk update

RUN apk add build-base
RUN apk add python
RUN apk add npm
RUN apk add nodejs
RUN apk add git

RUN mkdir -p /opt/uptime
RUN git clone --depth=1 https://github.com/openduty/uptime2/ /opt/uptime

WORKDIR /opt/uptime

RUN rm config/default.yaml
RUN mkdir -p /opt/uptime-config
RUN cp -rf /opt/uptime-config/* config/* 2>/dev/null

RUN npm install
RUN node app


EXPOSE 8082