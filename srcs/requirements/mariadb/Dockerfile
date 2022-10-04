FROM debian:buster

# updating packages
RUN apt-get update

# software installation
RUN apt-get install -y mariadb-server

# copying mysql client commands
COPY ./tools/schema.sql /etc/mysql/
COPY ./conf.sh /



CMD bash conf.sh