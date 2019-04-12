#!/bin/sh

php-fpm -D

nginx

composer install

cp .env.example .env

php artisan key:generate

echo -e "\033[36m Now, you can use Ctrl+C to continue! \033[0m"

tail -f /var/log/nginx/error.log
