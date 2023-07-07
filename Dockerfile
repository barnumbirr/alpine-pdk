FROM alpine:3.18

ENV PDK_DISABLE_ANALYTICS=true \
    PUPPET_DEVELOPMENT_KIT_VERSION=3.0.0

RUN apk add --no-cache \
    build-base \
    ruby-dev

RUN gem install \
    --no-document \
    pdk:$PUPPET_DEVELOPMENT_KIT_VERSION && \
    gem cleanup && \
    rm -rf /usr/lib/ruby/gems/*/cache/*

ENTRYPOINT ["/usr/bin/pdk"]
