FROM balenalib/armv7hf-alpine:latest-run

ARG CADDY_VER=1.0.0
ARG CADDY_URL=https://github.com/mholt/caddy/releases/download/v${CADDY_VER}/caddy_v${CADDY_VER}_linux_arm7.tar.gz
ARG CADDY_AUTO=https://getcaddy.com 

RUN apk add --update --no-cache --virtual .build curl bash &&\
    curl $CADDY_AUTO | bash -s personal tls.dns.cloudflare &&\
    apk del --purge .build &&\
    rm -rf /var/cache/* /tmp/* 

WORKDIR /caddy

ENTRYPOINT ["caddy"]

CMD ["-conf", "/caddy/Caddyfile", "-agree"]
