FROM php:7.2-fpm-alpine
COPY confd /etc/confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd \
	&& docker-php-ext-install bcmath \
	&& docker-php-ext-install mbstring \
	&& apk --no-cache add ssmtp

COPY docker-php-entrypoint /usr/local/bin/

ENTRYPOINT ["docker-php-entrypoint"]
CMD "php-fpm"