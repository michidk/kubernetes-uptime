FROM alpine

VOLUME /opt/uptime-config/

RUN apk update

RUN apk add build-base
RUN apk add python
RUN apk add npm
RUN apk add nodejs
RUN apk add git

RUN mkdir -p /opt/uptime/
RUN git clone --depth=1 git://github.com/fzaninotto/uptime.git /opt/uptime

WORKDIR /opt/uptime

RUN npm install
RUN node app

EXPOSE 8082