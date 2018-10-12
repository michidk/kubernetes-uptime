FROM alpine

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
RUN cp /opt/uptime-config/* config/*

RUN npm install
RUN node app