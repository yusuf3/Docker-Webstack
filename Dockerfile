FROM existenz/webstack:7.4

ARG ROOT_DIRECTORY=/deployment

WORKDIR $ROOT_DIRECTORY

COPY --chown=nginx:nginx . .

RUN apk update && apk -U --no-cache add \
    libzip-dev \
    # for php gd
    freetype-dev libpng-dev jpeg-dev libjpeg-turbo-dev \
    ## install php extensions
    php7 php7-pdo php7-openssl php7-dom php7-tokenizer php7-xmlwriter \
    php7-memcached php7-redis php7-sqlite3 php7-bz2 php7-mongodb php7-tidy php7-yaml \
    php7-pgsql \
    php7-mysqli \
    php7-common \
    php7-soap \
    php7-intl \
    php7-xsl \
    php7-imap \
    php7-ldap \
    php7-gd  \
    php7-dev \
    php7-bcmath \
    php7-zip \
    php7-xml \
    php7-pecl-apcu php7-curl php7-json php7-mbstring php7-opcache php7-zip php7-pdo_mysql php7-pcntl php7-exif php7-pecl-memcached php7-pecl-redis php7-fileinfo php7-phar \
    && rm -rf /var/cache/apk/* \
    # copy config files
    && cp ./config/php* /etc/php7/ \
    && cp ./config/nginx.conf /etc/nginx/

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN composer install \
  --no-scripts \
  --optimize-autoloader \
  --no-interaction \
  --no-progress \
  && find $ROOT_DIRECTORY -type d -exec chmod -R 770 {} \; \
  && find $ROOT_DIRECTORY -type f -exec chmod -R 660 {} \; \
  && chown -R nginx:nginx $ROOT_DIRECTORY
