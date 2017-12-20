FROM php:7.0-cli-alpine
RUN apk add --no-cache sqlite-dev \
	&& docker-php-ext-install bcmath pdo pdo_mysql pdo_sqlite mbstring
