#!/bin/bash

sleep 14

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

mkdir /var/www /var/www/html/wordpress

chmod 755 /var/www/html/wordpress

chown -R www-data:www-data /var/www/html/wordpress

cd  /var/www/html/wordpress

# ping mariadb

wp core download --allow-root

wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_USER_PASSWORD" --allow-root

wp core install --allow-root --url=$WORDPRESS_DOMAIN_NAME --title="WP-CLI" --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_EMAIL

wp user create "$WORDPRESS_U_NAME" "$WORDPRESS_U_EMAIL" --user_pass="$WORDPRESS_U_PASS" --role="$WORDPRESS_U_ROLE" --allow-root

# change listen port from unix socket to 9000
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf

sed -i 's#chdir = /var/www#chdir = /var/www/html/wordpress#g' /etc/php/7.4/fpm/pool.d/www.conf

# create a directory for php-fpm
mkdir -p /run/php
# start php-fpm service in the foreground to keep the container running
php-fpm7.4 -F

