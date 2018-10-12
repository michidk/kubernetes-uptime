FROM node:alpine

RUN apk update
RUN apk add --no-cache --virtual .gyp \
        python \
        make \
        g++ 

COPY uptime2 uptime
WORKDIR /uptime/

RUN npm install
RUN apk del .gyp

run node app