#!/bin/sh

openssl genpkey -algorithm RSA -out /etc/ssl/private/private.key

openssl req -new -key /etc/ssl/private/private.key -out /etc/ssl/certs/csr.pem \
  -subj "/C="US"/ST="Alabama"/L="Montgomery"/O="cm"/OU="cmm"/CN="miri"/emailAddress="cmm@email.com""

openssl x509 -req -days 365 -in /etc/ssl/certs/csr.pem -signkey /etc/ssl/private/private.key -out /etc/ssl/certs/certificate.crt

nginx -g "daemon off;"
