FROM alpine

RUN apk update

RUN apk add build-base
RUN apk add python
RUN apk add npm
RUN apk add nodejs
RUN apk add git

RUN mkdir -p /opt/uptime/
RUN git clone --depth=1 git://github.com/AlexanderYW/uptime.git /opt/uptime

WORKDIR /opt/uptime

RUN npm install

VOLUME /opt/uptime-config/
EXPOSE 8082