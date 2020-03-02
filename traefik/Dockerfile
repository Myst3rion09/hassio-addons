ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk --update upgrade \
    && apk --no-cache --no-progress add ca-certificates curl tzdata \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*

# Install traefik
ARG TRAEFIK_VERSION

# Download binary
RUN curl -fsSL -o /tar xzvf /tmp/traefik.tar.gz https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_${BUILD_ARCH}.tar.gz\
    && tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik \
    && rm -f /tmp/traefik.tar.gz \
    && chmod +x /usr/local/bin/traefik


LABEL \
    log=true \
    log.level=DEBUG \
    api.insecure=true \
    providers.docker=true \
    providers.docker.exposedbydefault=false \
    entrypoints.web.address=:80

RUN /usr/local/bin/traefik