FROM php:fpm-alpine

RUN apk add --no-cache openssl bash nodejs php-pgsql php-pdo_pgsql npm postgresql-dev shadow


WORKDIR /var/www

RUN rm -rf /var/www/html
RUN ln -s public html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN usermod -u 1000 www-data

COPY --chown=www-data:www-data . /var/www

RUN chmod -R 777 /var/www/storage

EXPOSE 9000

CMD ["php-fpm", "-F", "-R"]
