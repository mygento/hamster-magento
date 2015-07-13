FROM mygento/phpenv

MAINTAINER Nikita Tarasov <nikita@mygento.ru>

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q update && \
    DEBIAN_FRONTEND=noninteractive apt-get -q -y install mysql-server mysql-client && \
    /etc/init.d/mysql stop && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --mirror https://github.com/bragento/magento-core.git /opt/magento
RUN git clone https://github.com/EcomDev/EcomDev_PHPUnit.git /opt/ecomdev-phpunit && cd /opt/ecomdev-phpunit && git submodule update --init

RUN rm -rf /tmp/* /var/tmp/*
