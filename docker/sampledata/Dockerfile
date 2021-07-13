FROM ximbo/magento2-builder:2.4.2 as builder

ARG ARG_COMPOSER_MAGENTO_USERNAME
ARG ARG_COMPOSER_MAGENTO_PASSWORD

RUN composer config --global http-basic.repo.magento.com ${ARG_COMPOSER_MAGENTO_USERNAME} ${ARG_COMPOSER_MAGENTO_PASSWORD} \
    && mkdir -p ~/src/var/composer_home \
    && cp -f ~/.composer/auth.json ~/src/var/composer_home/auth.json \
    && php ~/src/bin/magento sampledata:deploy \
    && rm -rf ~/src/generated/code \
    && rm -f ~/.composer/auth.json \
    && rm -rf ~/src/var/composer_home

FROM ximbo/magento2-busybox

COPY --from=builder /var/www/magento/src/ /magento/
