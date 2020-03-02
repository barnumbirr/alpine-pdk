FROM alpine:3.11

ENV PDK_DISABLE_ANALYTICS=true \
    PUPPET_DEVELOPMENT_KIT_VERSION=1.17.0

RUN apk add --no-cache \
    build-base \
    libffi-dev \
    ruby \
    ruby-dev

RUN gem install \
    --no-rdoc --no-ri \
    pdk -v $PUPPET_DEVELOPMENT_KIT_VERSION

ENTRYPOINT ["/usr/bin/pdk"]
