#!/bin/bash

[ "$DEBUG" = "true" ] && set -x

# Substitute in php.ini values
[ ! -z "${PHP_MEMORY_LIMIT}" ] && sed -i "s#!PHP_MEMORY_LIMIT!#${PHP_MEMORY_LIMIT}#" /usr/local/etc/php/conf.d/zz-magento.ini
[ ! -z "${UPLOAD_MAX_FILESIZE}" ] && sed -i "s#!UPLOAD_MAX_FILESIZE!#${UPLOAD_MAX_FILESIZE}#" /usr/local/etc/php/conf.d/zz-magento.ini

# Configure PHP-FPM
[ ! -z "${MAGENTO_RUN_MODE}" ] && sed -i "s#!MAGENTO_RUN_MODE!#${MAGENTO_RUN_MODE}#" /usr/local/etc/php-fpm.conf
[ ! -z "${PHP_MEMORY_LIMIT}" ] && sed -i "s#!PHP_MEMORY_LIMIT!#${PHP_MEMORY_LIMIT}#" /usr/local/etc/php-fpm.conf
[ ! -z "${UPLOAD_MAX_FILESIZE}" ] && sed -i "s#!UPLOAD_MAX_FILESIZE!#${UPLOAD_MAX_FILESIZE}#" /usr/local/etc/php-fpm.conf

exec "$@"
