FROM node:12-alpine as builder

RUN apk add --no-cache git python make g++ \
 && git clone https://github.com/mrvautin/openKB.git /var/openkb \
 && cd /var/openkb \
 && npm install \
 && npm audit fix

FROM node:12-alpine

COPY --from=builder /var/openkb /var/openkb
WORKDIR /var/openkb

VOLUME [ "/var/openkb/data", "/var/openkb/config", "/var/openkb/public"]

EXPOSE 4444

CMD ["npm", "start"]
