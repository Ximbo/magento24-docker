IMAGE_CLI := ximbo/magento2-php-7.4-cli:1.0
IMAGE_FPM := ximbo/magento2-php-7.4-fpm:1.0
IMAGE_NGINX := ximbo/magento2-nginx:1.21.1

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
