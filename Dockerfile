FROM alpine

RUN apk update
RUN apk add build-base
RUN apk add python
RUN apk add npm
RUN apk add nodejs

COPY uptime2 uptime
WORKDIR /uptime/
RUN npm install