IMAGE_CLI := ximbo/magento2-php-7.4-cli:1.0
IMAGE_FPM := ximbo/magento2-php-7.4-fpm:1.0
IMAGE_NGINX := ximbo/magento2-nginx:1.21.1
IMAGE_BUSYBOX := ximbo/magento2-busybox:1.0
IMAGE_BUILDER := ximbo/magento2-builder:2.4.2
IMAGE_CODE := ximbo/magento2-code:2.4.2
IMAGE_SAMPLEDATA := ximbo/magento2-sampledata:2.4.2

.PHONY: all
all: build push

.PHONY: build
build: cli fpm nginx

.PHONY: push
push:
	@docker push $(IMAGE_CLI)
	@docker push $(IMAGE_FPM)
	@docker push $(IMAGE_NGINX)

# Make php cli image
.PHONY: cli
cli:
	@docker build -t $(IMAGE_CLI) -f php/Dockerfile.cli php

# Make php fpm image
.PHONY: fpm
fpm:
	@docker build -t $(IMAGE_FPM) -f php/Dockerfile.fpm php

# Make nginx image
.PHONY: nginx
nginx:
	@docker build -t $(IMAGE_NGINX) nginx

# Make busybox image
.PHONY: busybox
busybox:
	@docker build --pull -t $(IMAGE_BUSYBOX) busybox

# Make builder image
.PHONY: builder
builder:
	@docker build --pull --build-arg ARG_COMPOSER_MAGENTO_USERNAME=$(ARG_COMPOSER_MAGENTO_USERNAME) --build-arg ARG_COMPOSER_MAGENTO_PASSWORD=$(ARG_COMPOSER_MAGENTO_PASSWORD) -t $(IMAGE_BUILDER) builder

# Make code image
.PHONY: code
code:
	@docker build --pull --build-arg ARG_COMPOSER_MAGENTO_USERNAME=$(ARG_COMPOSER_MAGENTO_USERNAME) --build-arg ARG_COMPOSER_MAGENTO_PASSWORD=$(ARG_COMPOSER_MAGENTO_PASSWORD) -t $(IMAGE_CODE) code

# Make sampledata image
.PHONY: sampledata
sampledata:
	@docker build --pull --build-arg ARG_COMPOSER_MAGENTO_USERNAME=$(ARG_COMPOSER_MAGENTO_USERNAME) --build-arg ARG_COMPOSER_MAGENTO_PASSWORD=$(ARG_COMPOSER_MAGENTO_PASSWORD) -t $(IMAGE_SAMPLEDATA) sampledata
