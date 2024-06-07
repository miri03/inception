FROM debian:bullseye


RUN apt -y update && apt -y upgrade

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl

COPY ./tools/ssl.sh .

COPY ./conf/default.conf /etc/nginx/sites-enabled

RUN chmod +x ssl.sh

EXPOSE 443

CMD [ "sh" ,"ssl.sh" ]