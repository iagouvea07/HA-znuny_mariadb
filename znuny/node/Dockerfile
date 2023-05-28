FROM ubuntu:22.04

# Definitions

ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update

RUN apt-get install -y apache2 git curl vim wget mariadb-client bash jq cron

# CREATE OTRS USER
RUN useradd -d /opt/znuny -c 'Znuny user' otrs && \
    usermod -a -G www-data otrs && \
    usermod -a -G otrs www-data

RUN apt-get install -y  libarchive-zip-perl \
                        libcrypt-eksblowfish-perl \
                        libcrypt-ssleay-perl \
                        libtimedate-perl \
                        libdatetime-perl \
                        libdbi-perl \
                        libdbd-mysql-perl \
                        libdbd-odbc-perl \
                        libmoo-perl \
                        libjavascript-minifier-xs-perl \
                        libdbd-pg-perl \
                        libcss-minifier-xs-perl \
                        libencode-hanextra-perl \
                        libio-socket-ssl-perl \
                        libjson-xs-perl \
                        libmail-imapclient-perl \
                        libio-socket-ssl-perl \
                        libauthen-sasl-perl \
                        libauthen-ntlm-perl \
                        libapache2-mod-perl2 \
                        libnet-dns-perl \
                        libnet-ldap-perl \
                        libtemplate-perl \
                        libtemplate-perl \
                        libtext-csv-xs-perl \
                        libxml-libxml-perl \
                        libxml-libxslt-perl \
                        libxml-parser-perl \
                        libyaml-libyaml-perl \
                        libical-parser-perl \
                        libhash-merge-perl \
                        libdata-uuid-perl

RUN ln -s /opt/znuny/scripts/apache2-httpd.include.conf /etc/apache2/conf-available/zzz_znuny.conf

COPY services.sh services.sh
ENTRYPOINT  ["bash", "./services.sh"]

CMD ["/bin/sh"]