FROM ximbo/magento2-php-7.4-cli

ARG ARG_COMPOSER_MAGENTO_USERNAME
ARG ARG_COMPOSER_MAGENTO_PASSWORD
ARG HD=/var/www/magento

RUN echo "Dockerfile.Username" \
    && echo ${ARG_COMPOSER_MAGENTO_USERNAME} \
    && echo "Dockerfile.Password" \
    && echo ${ARG_COMPOSER_MAGENTO_PASSWORD}

RUN echo "WHIAMI" && whoami \
    && echo "PWD" && pwd && echo $HOME \
    && ls -la

RUN composer config --global http-basic.repo.magento.com ${ARG_COMPOSER_MAGENTO_USERNAME} ${ARG_COMPOSER_MAGENTO_PASSWORD}
RUN cat ${HD}/.composer/auth.json
RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition:2.4.2 --no-interaction src

RUN rm -rf ${HD}/.composer/cache/files/ \
    && rm -rf ${HD}/.composer/cache/repo/ \
    && rm -f ${HD}/.composer/auth.json
