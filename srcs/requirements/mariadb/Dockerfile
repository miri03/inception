FROM debian:bullseye

RUN apt -y update && apt -y upgrade

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY tools/maria.sh /maria.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x maria.sh

ENTRYPOINT [ "./maria.sh" ]