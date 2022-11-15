FROM ximbo/magento2-builder:2.4.5 as builder

RUN --mount=type=secret,id=composer,mode=0644,uid=1000,gid=1000 mkdir ~/.composer \
    && cp /run/secrets/composer ~/.composer/auth.json \
    && mkdir -p ~/src/var/composer_home \
    && cp -f ~/.composer/auth.json ~/src/var/composer_home/auth.json \
    && php ~/src/bin/magento sampledata:deploy \
    && rm -rf ~/src/generated/code \
    && rm -rf ~/.composer/ \
    && rm -rf ~/src/var/composer_home/

FROM ximbo/magento2-busybox

COPY --from=builder /var/www/magento/src/ /magento/