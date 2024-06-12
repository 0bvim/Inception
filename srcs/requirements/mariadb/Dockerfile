FROM debian:oldstable

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tool/db_init.sh /tmp/db_init.sh

RUN chmod 777 /tmp/db_init.sh && bash /tmp/db_init.sh

CMD ["mysqld_safe"]
