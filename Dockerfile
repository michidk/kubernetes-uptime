FROM alpine

VOLUME /opt/uptime-config/

RUN apk update

RUN apk add build-base
RUN apk add python
RUN apk add npm
RUN apk add nodejs
RUN apk add git

RUN mkdir -p /temp/uptime
RUN git clone --depth=1 git://github.com/fzaninotto/uptime.git /temp/uptime
RUN rm -f /temp/uptime/config/default.yaml /temp/uptime/config/test.yaml
RUN mkdir -p /opt/uptime/
RUN cp -rf /temp/uptime/* /opt/uptime/
RUN rm -rf /temp/uptime

WORKDIR /opt/uptime

RUN npm install
RUN node app

EXPOSE 8082