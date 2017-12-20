FROM php:7.0-fpm-alpine
COPY confd /etc/confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd \
   && apk add --no-cache sqlite-dev \
	&& docker-php-ext-install bcmath pdo pdo_mysql pdo_sqlite mbstring \
	&& apk --no-cache add ssmtp

COPY docker-php-entrypoint /usr/local/bin/

ENTRYPOINT ["docker-php-entrypoint"]
CMD "php-fpm"
