FROM alpine:3.17

ENV IPFS_VERSION=latest
ENV IPFS_MONITORING=1
ENV IPFS_PATH=/data/ipfs

RUN \
    apk add --no-cache catatonit bash procps nodejs && \
    apk add --no-cache --virtual .build-deps npm git build-base python3 && \
    npm install -g --build-from-source ipfs@"$IPFS_VERSION" && \
    npm cache clear --force && \
    git clone --depth 1 https://github.com/sevenrats/bash-signal-proxy.git && \
    cp bash-signal-proxy/signalproxy.sh / && \
    apk del .build-deps && \
    rm -rf bash-signal-proxy /node-* /SHASUMS256.txt /tmp/* /root/.electron /root/.cache \
        /sbin/apk /etc/apk /lib/apk /usr/share/apk /var/lib/apk \ 
        /usr/share/man/* /usr/share/doc /root/.npm /root/.node-gyp /root/.config \
        /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/docs \
        /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts && \
    { rm -rf /root/.gnupg || true; }

RUN \
    ln -s /usr/local/bin/jsipfs /usr/local/bin/ipfs

EXPOSE 4002
EXPOSE 4003
EXPOSE 5002
EXPOSE 9090

COPY entrypoint.sh /entrypoint.sh

CMD ["catatonit", "/entrypoint.sh"]
