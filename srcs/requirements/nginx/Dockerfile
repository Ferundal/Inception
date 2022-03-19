FROM debian:buster

#LABEL maintainer = <cjettie@student.21-school.ru>

RUN apt-get update -y && \
	apt-get	upgrade -y

RUN apt-get install -y wget \
                        vim

RUN apt-get install -y nginx \
                        openssl

CMD ["nginx", "-g", "daemon off;"]