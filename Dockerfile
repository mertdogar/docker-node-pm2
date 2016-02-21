FROM mhart/alpine-node:5.6.0
MAINTAINER DoveCote <info@dove-cote.co>

RUN apk update && \
    apk add --no-cache git && \
    npm install --unsafe-perm -g pm2@latest && \
    apk del git && \
    rm -rf /etc/ssl \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

WORKDIR /app
ADD start /start
RUN chmod 755 /start
CMD ["sh","/start"]

EXPOSE 80
EXPOSE 443

