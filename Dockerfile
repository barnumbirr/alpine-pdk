FROM alpine:3.14

ENV PDK_DISABLE_ANALYTICS=true \
    PUPPET_DEVELOPMENT_KIT_VERSION=2.2.0

RUN apk add --no-cache \
    build-base \
    libffi-dev \
    ruby \
    ruby-dev \
    ruby-io-console

RUN gem install \
    --no-document \
    pdk -v $PUPPET_DEVELOPMENT_KIT_VERSION

ENTRYPOINT ["/usr/bin/pdk"]
