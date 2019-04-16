FROM php:7.3.4-fpm-alpine3.9

MAINTAINER awesome-laravel-api

WORKDIR /data

# use chinese repository
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer \
    && composer config -g repo.packagist composer https://packagist.laravel-china.org

# install libs
RUN apk update
RUN apk add --no-cache nginx
RUN docker-php-ext-install bcmath
RUN mkdir /run/nginx

# composer install
COPY ./composer.json /data/composer.json
COPY ./composer.lock /data/composer.lock

RUN cd /data && composer install --prefer-dist --no-dev --no-scripts --no-autoloader

COPY . /data/

RUN composer dump-autoload --no-scripts --no-dev --optimize

# copy configs
ADD ./docker/nginx-conf/host.conf /etc/nginx/conf.d/default.conf

ADD ./docker/entrypoint.sh /

RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
