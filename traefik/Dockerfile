ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk --update upgrade \
    && apk --no-cache --no-progress add ca-certificates curl tzdata \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*

# Install traefik
ARG TRAEFIK_VERSION

# Download binary
RUN curl -fsSL -o /tmp/traefik.tar.gz https://github.com/containous/traefik/releases/download/v2.1.6/traefik_v2.1.6_linux_arm64.tar.gz \
    && tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik \
    && rm -f /tmp/traefik.tar.gz \
    && chmod +x /usr/local/bin/traefik

COPY data/run.sh /run.sh

CMD ["/run.sh"]