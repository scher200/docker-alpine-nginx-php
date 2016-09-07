FROM alpine:3.4
MAINTAINER scher200

# Add testing repo to get latest apk packages RUN echo "ipv6" >> /etc/modules
RUN echo "ipv6" >> /etc/modules

# Install packages
RUN apk upgrade -U 
RUN apk --no-cache --update add \
    openssl \
    php5 \
    php5-xml \
    php5-xsl \
    php5-pdo \
    php5-pdo_mysql \
    php5-pdo_pgsql \
    php5-mcrypt \
    php5-curl \
    php5-json \
    php5-fpm \
    php5-phar \
    php5-gd \
    php5-openssl \
    php5-mysqli \
    php5-ctype \
    php5-opcache \
    php5-common \
    php5-iconv \
    php5-pdo_sqlite \
    php5-sqlite3 \
    php5-pcntl \
    wget \ 
    curl \
    nginx \
    bash \
    openssl \
    ca-certificates \
    opensmtpd \
    supervisor

RUN rm -fr /var/cache/apk/*

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64
RUN chmod +x /usr/local/bin/dumb-init

# Insert the root folder and overwrite the configuration files
COPY /rootfs /

# Add application
RUN mkdir -p /var/www/html
WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/dumb-init"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
