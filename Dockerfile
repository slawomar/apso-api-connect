FROM php:8.4-cli

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        unzip \
        libpq-dev \
    && docker-php-ext-install pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
