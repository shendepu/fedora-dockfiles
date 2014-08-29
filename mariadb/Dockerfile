FROM shendepu/fedora:20
MAINTAINER "Jimmy Shen" <shendepu@hotmail.com>

ADD ./mariadb.repo /etc/yum.repos.d/mariadb.repo

RUN yum -y update; yum clean all
RUN yum -y install supervisor expect MariaDB-server MariaDB-client

ADD ./start.sh /start.sh
ADD ./mysql.conf /mysql.conf
ADD ./config_mysql.sh /config_mysql.sh
ADD ./supervisord.conf /etc/supervisord.conf

RUN chmod 755 /start.sh
RUN chmod 755 /config_mysql.sh
RUN /config_mysql.sh

RUN yum -y remove expect; yum clean all;

RUN rm -f /mysql.conf /config_mysql.sh

EXPOSE 3306

CMD ["/bin/bash", "/start.sh"]
