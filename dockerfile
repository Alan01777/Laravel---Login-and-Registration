FROM php:fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    bash \
    nodejs \
    && docker-php-ext-install pdo_pgsql pgsql

WORKDIR /var/www

RUN rm -rf /var/www/html
RUN ln -s public html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000

CMD ["php-fpm", "-F", "-R"]
