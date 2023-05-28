#!/bin/bash

service apache2 start

a2enmod perl headers deflate filter cgi
a2dismod mpm_event
a2enmod mpm_prefork
a2enconf zzz_znuny
a2enmod rewrite

echo \
'<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        RewriteEngine on
        RewriteRule /atendentes znuny/index.pl?Action=Login [R]
        RewriteRule /clientes znuny/customer.pl?Action=Login [R]
        RewriteRule /$ znuny/customer.pl?Action=Login [R]
        Redirect "/install" "/otrs/installer.pl"
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

service apache2 restart
service cron start

echo "*/3 * * * * otrs        /opt/znuny/bin/otrs.Daemon.pl stop; /opt/otrs/bin/otrs.Daemon.pl start " >> /etc/crontab

service cron restart
exec "$@"