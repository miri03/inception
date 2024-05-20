#!/bin/sh

docker stop nginx-container

docker rm nginx-container

docker rmi nginx:latest 

docker build . -t nginx

docker run --name nginx-container -dp  8002:443 nginx 

docker exec -it nginx-container bash
