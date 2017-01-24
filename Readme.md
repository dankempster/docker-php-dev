# Docker PHP Containers with Xdebug

These containers are configured for developing in PHP.
 
 - Composer
 - Xdebug extension
 - Errors are displayed
 
## Composer
 
Composer is a part of all open-source PHP dev's lives these days, so it's provided by this image; Although it's not actually installed--Because composer ages quickly and I want to avoid stale Docker images.
 
Instead, on the first run, composer is install into a Docker volume at ```/composer```.

```bash
$ docker run dankempster/php-dev
```

So subsequent runs of the image can execute composer commands.

```bash
$ docker run -v $(pwd):/project dankempster/php-dev composer install
``` 

If you name the volume, you can share it between projects too.
