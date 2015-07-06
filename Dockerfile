FROM mygento/phpenv


MAINTAINER Nikita Tarasov <nikita@mygento.ru>

RUN echo $TRAVIS_PHP_VERSION

#RUN php -i
#RUN apt-get -q -y install mysql-server
