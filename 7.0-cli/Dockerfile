FROM php:7.0-cli-alpine as builder
RUN apk add --no-cache coreutils sqlite-dev libxml2-dev curl-dev gmp-dev icu-dev libpng-dev jpeg-dev freetype-dev autoconf imagemagick-dev gcc libc-dev make libtool \
	&& docker-php-ext-install -j$(nproc) bcmath pdo pdo_mysql pdo_sqlite mbstring json xml zip curl gmp intl gd \
	&& pecl install imagick \
	&& docker-php-ext-enable imagick

FROM php:7.0-cli-alpine

COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-20151012 /usr/local/lib/php/extensions/no-debug-non-zts-20151012

COPY confd /etc/confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64 /usr/local/bin/confd

RUN chmod +x /usr/local/bin/confd \
	&& apk add --no-cache sqlite libxml2 curl gmp icu libpng jpeg freetype imagemagick gcc ssmtp \
	&& docker-php-ext-enable bcmath pdo pdo_mysql pdo_sqlite mbstring json xml zip curl gmp intl gd imagick

COPY docker-php-entrypoint /usr/local/bin/

ENTRYPOINT ["docker-php-entrypoint"]
CMD "php"
