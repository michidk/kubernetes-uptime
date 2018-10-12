FROM debian

apt-get update
apt-get install npm nodejs

COPY uptime2 uptime
WORKDIR /uptime/
RUN npm install