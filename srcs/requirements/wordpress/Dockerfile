FROM debian:bullseye

RUN apt -y update && apt -y upgrade

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php7.4-fpm php-mysql mariadb-client iputils-ping

# COPY conf/wp-config.php /var/www/wordpress/

COPY tools/wordpress.sh .

RUN chmod +x wordpress.sh

CMD [ "./wordpress.sh" ]