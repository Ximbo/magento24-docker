#!/bin/bash

[ "$DEBUG" = "true" ] && set -x

# Start cron if required
if [ "$ENABLE_CRON" == "true" ]; then
    CRON_LOG=/var/log/cron.log

    # Setup Magento cron
    echo "* * * * * docker /usr/local/bin/php ${SERVER_ROOT}/bin/magento cron:run | grep -v \"Ran jobs by schedule\" >> ${SERVER_ROOT}/var/log/magento.cron.log" | sudo tee /etc/cron.d/magento

    # Get rsyslog running for cron output
    sudo touch $CRON_LOG
    echo "cron.* $CRON_LOG" | sudo tee /etc/rsyslog.d/cron.conf
    sudo service rsyslog start
fi

# Configure xdebug if required
[ "$PHP_ENABLE_XDEBUG" = "true" ] && \
    sudo docker-php-ext-enable xdebug && \
    echo "Xdebug is enabled"

# Configure composer
[ ! -z "${COMPOSER_GITHUB_TOKEN}" ] && \
    composer config --global github-oauth.github.com $COMPOSER_GITHUB_TOKEN

[ ! -z "${COMPOSER_MAGENTO_USERNAME}" ] && \
    composer config --global http-basic.repo.magento.com \
        $COMPOSER_MAGENTO_USERNAME $COMPOSER_MAGENTO_PASSWORD

exec "$@"
