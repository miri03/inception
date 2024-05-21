FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx mariadb-client

COPY ./conf/default.conf /etc/nginx/sites-enabled

COPY ./conf/certificate.crt /etc/ssl/

COPY ./conf/private.key /etc/ssl/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# mariadb -h mariadb-container -u root -p123

#sudo aa-remove-unknown
