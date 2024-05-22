FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl mariadb-client

COPY ./conf/default.conf /etc/nginx/sites-enabled

COPY ./tools/ssl.sh .

RUN chmod +x ssl.sh

EXPOSE 443

CMD [ "sh" ,"ssl.sh" ]



# mariadb -h mariadb-container -p123

#sudo aa-remove-unknown
