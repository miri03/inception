#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

mkdir /var/www

mkdir /var/www/wordpress

chmod 755 /var/www/wordpress

chown -R www-data:www-data /var/www/wordpress

cd  /var/www/wordpress

wp core download --allow-root

sleep infinity


# /usr/sbin/php-fpm7.4 -F