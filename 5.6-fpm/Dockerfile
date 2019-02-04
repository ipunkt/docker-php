FROM php:5.6-fpm-alpine as builder
RUN apk add --no-cache coreutils sqlite-dev libxml2-dev curl-dev gmp-dev icu-dev libpng-dev jpeg-dev freetype-dev autoconf imagemagick-dev gcc libc-dev rabbitmq-c-dev make libtool \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/freetype2 --with-jpeg-dir=/usr/include \
	&& docker-php-ext-install -j$(nproc) bcmath mysql pdo pdo_mysql pdo_sqlite mbstring json xml zip curl gmp intl gd soap \
	&& pecl install imagick \
	&& pecl install amqp \
	&& docker-php-ext-enable imagick

FROM php:5.6-fpm-alpine

COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-20131226 /usr/local/lib/php/extensions/no-debug-non-zts-20131226

COPY confd /etc/confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd \
	&& apk add --no-cache sqlite libxml2 curl gmp icu libpng jpeg freetype imagemagick gcc ssmtp libmcrypt-dev rabbitmq-c \
	&& docker-php-ext-install mcrypt \
	# Fix alpine iconv problems part 1
	# See https://github.com/docker-library/php/issues/240
	&& apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv \
	&& docker-php-ext-enable bcmath pdo pdo_mysql mysql pdo_sqlite mbstring json xml zip curl gmp intl gd imagick soap mcrypt
#mcrypt predis imagick

# Fix alpine iconv problems part 2
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so

COPY docker-php-entrypoint /usr/local/bin/

ENTRYPOINT ["docker-php-entrypoint"]
CMD "php-fpm"
