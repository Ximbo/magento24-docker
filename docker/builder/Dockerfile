FROM ximbo/magento2-php-7.4-cli

ARG ARG_COMPOSER_MAGENTO_USERNAME
ARG ARG_COMPOSER_MAGENTO_PASSWORD

RUN sudo apt-get update \
    && sudo apt-get install -y git \
    && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && composer config --global "http-basic.repo.magento.com" ${ARG_COMPOSER_MAGENTO_USERNAME} ${ARG_COMPOSER_MAGENTO_PASSWORD} \
    && composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition:2.4.2 --no-interaction src \
    && rm -rf ~/.composer/cache/files/ \
    && rm -rf ~/.composer/cache/repo/ \
    && rm -f ~/.composer/auth.json