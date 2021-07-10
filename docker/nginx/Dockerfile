FROM nginx:1.21.1

COPY etc/vhost.conf /etc/nginx/conf.d/default.conf
COPY etc/certs/ /etc/nginx/ssl/
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN addgroup --gid 1000 docker
RUN usermod -a -G docker nginx

ENV USER_HOME /var/www/magento
ENV SERVER_ROOT /var/www/magento/src
ENV SERVER_SSL on
ENV VIRTUAL_HOST magento24.test
ENV VIRTUAL_PORT 443
ENV UPLOAD_MAX_FILESIZE 64M
ENV MAGENTO_RUN_MODE developer

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

RUN mkdir /sock

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
