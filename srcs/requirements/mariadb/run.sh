#!/bin/sh

docker stop mariadb-container

docker rm mariadb-container

docker rmi mariadb:latest 

docker build . -t mariadb

docker run --name mariadb-container -dp  3306:3306 mariadb 

docker exec -it mariadb-container bash


