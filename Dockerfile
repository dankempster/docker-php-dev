FROM dankempster/composer:latest

MAINTAINER dev@dankempster.co.uk

ENV XDEBUG_VERSION 2.5.0
ENV XDEBUG_SHA1 0d31602a6ee2ba6d2e18a6db79bdb9a2a706bcd9

# Set PHP config
COPY config/*.ini /usr/local/etc/php/conf.d/
