FROM shendepu/fedora:mariadb
MAINTAINER "Jimmy Shen" <shendepu@hotmail.com>

ADD ./mysql_db.conf /mysql_db.conf
ADD ./config_mysql.sh /config_mysql.sh

RUN chmod 755 /config_mysql.sh
RUN /config_mysql.sh

RUN rm -f /mysql_db.conf /config_mysql.sh;

EXPOSE 3306

CMD ["/bin/bash", "/start.sh"]
