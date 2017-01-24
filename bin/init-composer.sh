#!/bin/sh

if [ ! -f /composer/bin/composer.phar ]; then
    cd /composer

    set composerSig=$(curl https://composer.github.io/installer.sig)

    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === ${composerSig}) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php --install-dir=/composer/bin --filename=composer.phar; \
    php -r "unlink('composer-setup.php');";

    cd -

    chown -R www-data:www-data /composer*
    find /composer -type d -exec chmod 2775 '{}' \;
    find /composer -type f -exec chmod 0664 '{}' \;
    find /composer-cache -type d -exec chmod 2775 '{}' \;
    find /composer-cache -type f -exec chmod 0664 '{}' \;
    find /composer/bin -type f -exec chmod +x '{}' \;

    if [ ! -f /composer/bin/composer ]; then
        ln -s /composer/bin/composer.phar /composer/bin/composer
    fi
else
    /composer/bin/composer.phar selfupdate &
fi;

if [ ! "$OAUTH_TOKEN" = "" ]; then
    /composer/bin/composer.phar config -g -- github-oauth.github.com $OAUTH_TOKEN
fi;
