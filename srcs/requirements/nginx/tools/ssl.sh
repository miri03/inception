#!/bin/sh

sed -i "s#ssl_certificate;#ssl_certificate ${SSL_CERT};#g" /etc/nginx/sites-enabled/default.conf

sed -i "s#ssl_certificate_key#ssl_certificate_key ${SSL_CERT_K};#g" /etc/nginx/sites-enabled/default.conf

openssl req -x509 -nodes -out $SSL_CERT -keyout $SSL_CERT_K -subj "/C="US"/ST="Alabama"/L="Montgomery"/O="cm"/OU="cmm"/CN="miri"/emailAddress="cmm@email.com""

nginx -g "daemon off;"
