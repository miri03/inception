FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY tools/maria.sh /maria.sh

RUN chmod +x maria.sh

ENTRYPOINT [ "/maria.sh" ]