FROM debian:bullseye

RUN apt -y update && apt -y upgrade

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php7.4-fpm php-mysql mariadb-client

RUN mkdir -p /var/www /var/www/html/wordpress

COPY tools/wordpress.sh .

RUN chmod +x wordpress.sh

CMD [ "./wordpress.sh" ]