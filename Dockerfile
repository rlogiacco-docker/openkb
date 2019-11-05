FROM node:12-alpine

RUN apk add --no-cache git python make g++ \
 && git clone https://github.com/mrvautin/openKB.git var/openkb \
 && cd /var/openkb \
 && npm install \
 && npm audit fix \
 && apk del git python make g++


WORKDIR /var/openkb

VOLUME [ "/var/openkb/data", "/var/openkb/config", "/var/openkb/public"]

EXPOSE 4444
CMD ["npm", "start"]
