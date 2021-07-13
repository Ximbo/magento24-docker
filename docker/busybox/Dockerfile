FROM busybox

RUN addgroup --gid 1000 docker && \
    adduser --uid 1000 --ingroup docker --home /home/docker --shell /bin/bash --disabled-password --gecos "" docker && \
    mkdir -p /magento && \
    chown -R docker:docker /magento

WORKDIR /magento

USER docker:docker