FROM ximbo/magento2-php-7.4-cli

ARG ARG_COMPOSER_MAGENTO_USERNAME
ARG ARG_COMPOSER_MAGENTO_PASSWORD
ARG HD=/var/www/magento

RUN composer create-project --repository-url=https://${ARG_COMPOSER_MAGENTO_USERNAME}:${ARG_COMPOSER_MAGENTO_PASSWORD}@repo.magento.com/ magento/project-community-edition:2.4.2 --no-interaction src

RUN rm -rf ${HD}/.composer/cache/files/ \
    && rm -rf ${HD}/.composer/cache/repo/ \
    && rm -f ${HD}/.composer/auth.json
