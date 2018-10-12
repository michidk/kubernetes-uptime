FROM alpine

RUN apk update
RUN apk add npm
RUN apk add nodejs

WORKDIR /uptime2/
RUN npm install