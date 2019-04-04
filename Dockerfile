FROM balenalib/armv7hf-alpine

ARG CADDY_VER=0.11.5
ARG CADDY_URL=https://github.com/mholt/caddy/releases/download/v${CADDY_VER}/caddy_v${CADDY_VER}_linux_arm7.tar.gz

RUN apk add --update --no-cache --virtual .build curl &&\
    curl -sSL $CADDY_URL | tar xz -C /usr/local/bin/ caddy &&\
    apk del --purge .build &&\
    rm -rf /var/cache/* /tmp/* 

WORKDIR /caddy

ENTRYPOINT ["/usr/local/bin/caddy"]

CMD ["-conf", "/caddy/Caddyfile", "-agree"]
