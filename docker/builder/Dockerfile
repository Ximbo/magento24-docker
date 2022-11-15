# syntax = docker/dockerfile:1.3

FROM ximbo/magento2-php-8.1-cli

RUN sudo rm /usr/local/etc/php/conf.d/zz-xdebug.ini \
    && sudo pecl uninstall xdebug

RUN --mount=type=secret,id=composer,mode=0644,uid=1000,gid=1000 mkdir ~/.composer \
    && cp /run/secrets/composer ~/.composer/auth.json \
    && composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition:2.4.5-p1 --no-interaction ~/src \
    && rm -rf ~/.composer/
