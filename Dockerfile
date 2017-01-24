FROM dankempster/composer:latest

MAINTAINER dev@dankempster.co.uk

ENV XDEBUG_VERSION 2.5.0
ENV XDEBUG_SHA1 0d31602a6ee2ba6d2e18a6db79bdb9a2a706bcd9

# Set PHP config
COPY config/*.ini /usr/local/etc/php/conf.d/

# Set up composer
COPY bin/ /usr/local/bin
RUN chmod +x /usr/local/bin/init-composer.sh; \
    \
    mkdir -p /composer/bin; \
    mkdir -p /composer/home; \
    \
    chown -R www-data:www-data /composer*; \
    chmod -R 2775 /composer*;

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer/home

ENV PATH $PATH:/composer/bin:/composer/home/vendor/bin

VOLUME /composer