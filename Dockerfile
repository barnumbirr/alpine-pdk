FROM alpine:3.14
# Keep 'older' Alpine/Ruby version until
# https://github.com/puppetlabs/pdk/issues/1171
# is resolved.
# See: https://github.com/barnumbirr/action-forge-publish/issues/5


ENV PDK_DISABLE_ANALYTICS=true \
    PUPPET_DEVELOPMENT_KIT_VERSION=2.7.0

RUN apk add --no-cache \
    build-base \
    libffi-dev \
    ruby \
    ruby-dev \
    ruby-io-console

RUN gem install \
    --no-document \
    pdk -v $PUPPET_DEVELOPMENT_KIT_VERSION && \
    gem cleanup && \
    rm -rf /usr/lib/ruby/gems/*/cache/*

ENTRYPOINT ["/usr/bin/pdk"]
