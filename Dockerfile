FROM alpine

RUN apk update

RUN apk --no-cache add --virtual build-dependencies build-base git python make gcc g++ linux-headers udev
RUN apk --no-cache add npm nodejs git

RUN mkdir -p /opt/uptime/
RUN git clone --depth=1 git://github.com/michidk/uptime.git /opt/uptime

WORKDIR /opt/uptime

RUN npm install
RUN apk del build-dependencies

VOLUME /opt/uptime-config/
EXPOSE 8082
ENTRYPOINT ["node", "app"]
