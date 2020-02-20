FROM traefik:v2.1

LABEL \
    log=true \
    log.level=DEBUG \
    api.insecure=true \
    providers.docker=true \
    providers.docker.exposedbydefault=false \
    entrypoints.web.address=:80
