FROM php:apache
COPY build/system.sh /root/
COPY build/typo3.sh /root/
COPY config/info.php /var/www/html/
COPY config/typo3.ini /usr/local/etc/php/conf.d/
RUN /root/system.sh
RUN /root/typo3.sh
