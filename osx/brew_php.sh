#!/bin/sh

brew install \
    php55 \
    --with-fpm \
    --with-intl \
    --with-imap

brew install \
    php55-amqp \
    php55-imagick \
    php55-intl \
    php55-mcrypt \
    php55-oauth \
    php55-opcache \
    php55-redis \
    php55-xdebug

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer