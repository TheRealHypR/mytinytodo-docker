FROM php:7.4-apache

RUN apt-get update && apt-get -y install wget curl unzip
RUN wget $(curl -s https://api.github.com/repos/maxpozdeev/mytinytodo/releases/latest | grep 'browser_' | cut -d\" -f4) -O latest.zip
RUN unzip latest.zip
RUN cp -R mytinytodo/* /var/www/html && chown -R www-data:www-data /var/www/html/*
