FROM resin/rpi-raspbian:latest
MAINTAINER Leonardo Merza "ljmerza@gmail.com"

ENV MARIADB_VERSION 10.2.5

RUN apt-get update && apt-get install wget

# get mariadb source code
RUN cd /tmp && \
	wget http://mirrors.opencas.cn/mariadb//mariadb-${MARIADB_VERSION}/source/mariadb-${MARIADB_VERSION}.tar.gz \
	tar xvf mariadb-${MARIADB_VERSION}.tar.gz \
	apt-get build-dep mariadb-server

# build mariadb
RUN cd /tmp/mariadb-$MARIADB_VERSION}/ \
	cmake . -DBUILD_CONFIG=mysql_release

# run secure script
ADD secure_install.sql /tmp/secure_install.sql
RUN service mysql start && mysql -u root < /tmp/secure_install.sql

# remove tmp files
RUN rm /tmp/secure_install.sql \
	rm -r /tmp/mariadb-${MARIADB_VERSION}/

# add to startup
RUN sudo update-rc.d mysql defaults
RUN service mysql start