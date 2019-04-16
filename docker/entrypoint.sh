#!/bin/sh

cp .env.example .env

sed -i "s/^APP_KEY=.*/APP_KEY=$APP_KEY/g" .env

php-fpm -D

nginx

top
