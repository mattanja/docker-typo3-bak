#!/bin/bash
echo "alias ll=\"ls -alh --color\"" >> /root/.profile

apt-get update && \
apt-get install -y --no-install-recommends \
 wget \
 git \
 libxml2-dev \
 libfreetype6-dev \
 libjpeg62-turbo-dev \
 libmcrypt-dev \
 libpng12-dev \
 zlib1g-dev

docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
docker-php-ext-install -j$(nproc) mysqli soap gd zip zlib opcache

a2enmod rewrite

apt-get clean
apt-get purge \
 libxml2-dev \
 libfreetype6-dev \
 libjpeg62-turbo-dev \
 libmcrypt-dev \
 libpng12-dev \
 zlib1g-dev

rm -rf /var/lib/apt/lists/* /usr/src/*