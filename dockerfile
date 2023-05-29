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

# Define o usuário e o grupo "www-data" com a mesma ID do usuário/host para evitar problemas de permissão
ARG USER_ID=1000
ARG GROUP_ID=1000

# Verifica se o grupo "www-data" já existe
RUN if getent group www-data; then \
      groupmod -g ${GROUP_ID} www-data; \
    else \
      groupadd -g ${GROUP_ID} www-data; \
    fi

# Verifica se o usuário "www-data" já existe
RUN if id -u www-data; then \
      usermod -u ${USER_ID} -g www-data www-data; \
    else \
      useradd -u ${USER_ID} -ms /bin/bash -g www-data www-data; \
    fi

# Define as permissões corretas para os diretórios de log e cache
RUN mkdir -p /var/www/storage/logs /var/www/bootstrap/cache && \
    chown -R www-data:www-data /var/www/storage/logs /var/www/bootstrap/cache && \
    chmod -R 775 /var/www/storage/logs /var/www/bootstrap/cache

EXPOSE 9000

CMD ["php-fpm", "-F", "-R"]
