FROM tomcat:8.5.60-jdk15-openjdk-slim
COPY ROOT /usr/local/tomcat/webapps/ROOT

ENV MYSQL_USER=mysql \
    MYSQL_VERSION=5.7.26 \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server=${MYSQL_VERSION}* \
    && rm -rf ${MYSQL_DATA_DIR} \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh
