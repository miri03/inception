FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php7.4-fpm php-mysql mariadb-client iputils-ping

COPY tools/wordpress.sh .

RUN chmod +x wordpress.sh

CMD [ "./wordpress.sh" ]