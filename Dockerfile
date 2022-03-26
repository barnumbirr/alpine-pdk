FROM alpine:3.15

ENV PDK_DISABLE_ANALYTICS=true \
    PUPPET_DEVELOPMENT_KIT_VERSION=2.4.0

RUN apk add --no-cache \
    build-base \
    ruby \
    ruby-dev

RUN gem install \
    --no-document \
    pdk -v $PUPPET_DEVELOPMENT_KIT_VERSION && \
    gem cleanup && \
    rm -rf /usr/lib/ruby/gems/*/cache/*

ENTRYPOINT ["/usr/bin/pdk"]
