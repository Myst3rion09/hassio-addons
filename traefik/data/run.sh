#!/usr/bin/env bashio

PROXY_URL=$(bashio::config 'proxy_url')

cat<<EOF > "config.yaml"
http:
  routers:
    proxy:
      entryPoints:
        - web
      rule: "HostRegexp(\`{host:.+}\`)"
      service: proxy
  services:
    proxy:
      loadBalancer:
        passHostHeader: true
        servers:
          - url: '${PROXY_URL}'
EOF

/usr/local/bin/traefik \
  --log \
  --accesslog=true \
  --providers.file.filename=/config.yaml \
  --entryPoints.web.address=:80 \
  --entryPoints.web.forwardedHeaders.insecure \
  --entryPoints.web.proxyProtocol.insecure