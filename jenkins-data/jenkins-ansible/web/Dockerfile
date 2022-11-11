FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN                                                                  \
  yum -y install nginx openssl --enablerepo=nginx          && \
  yum -y install https://repo.ius.io/ius-release-el7.rpm             \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
  yum -y install                                                     \
    yum-utils                                                        \
    http://rpms.remirepo.net/enterprise/remi-release-7.rpm           \
    php-fpm                                                   \
    php-cli                                                   \
    php-mysqlnd                                                   \
    php-soap                                                      \
    php-xml                                                       \
    php-zip                                                       \
    php-json                                                      \
    php-mbstring                                                  \
    php-zip                                                       \
    php-gd                                                        \
    --enablerepo=ius-archive && yum clean all

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh
