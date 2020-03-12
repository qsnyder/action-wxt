FROM alpine:3.7

LABEL "com.github.actions.name"="Post WxT"
LABEL "com.github.actions.description"="Post Message to Webex Teams"

LABEL version=v0.1.0
LABEL repository="https://github.com/qsnyder/action-wxt"
LABEL maintainer="Quinn Snyder <qsnyder@cisco.com>"

RUN apk update && \
    apk add --no-cache curl && \
    rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]