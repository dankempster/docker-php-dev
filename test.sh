#!/usr/bin/env bash

if [ $# = 0 ]; then
    echo "USAGE: test.sh image-name";
    echo ""
    echo " - image-name: Name of docker image to run tests against"
    exit 1
fi

set -x

# PHP is avaialble
docker run --rm "$1" php -v
# Xdebug is installed
docker run --rm "$1" php -i | grep "xdebug support"
# Xdebug is enabled
docker run --rm "$1" php -i | grep "xdebug support => enabled"
# error_reporting = E_ALL
docker run --rm "$1" php -i | grep "error_reporting => 32767"
