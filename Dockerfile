FROM mygento/phpenv

MAINTAINER Nikita Tarasov <nikita@mygento.ru>

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q update && \
    DEBIAN_FRONTEND=noninteractive apt-get -q -y install mysql-server mysql-client && \
    /etc/init.d/mysql stop && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --mirror https://github.com/bragento/magento-core.git /opt/magento

ADD ./scripts/start.sh /start.sh

RUN phpenv versions

RUN phpenv global 5.5.26

RUN php --version

RUN php -i

RUN rm -rf /tmp/* /var/tmp/*

CMD ["/bin/bash", "/start.sh"]
