FROM ubuntu:22.04


ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update

RUN apt-get install -y git curl vim wget bash jq

RUN mkdir /opt/znuny

RUN su -c "git clone -b rel-7_0 --single-branch https://github.com/Znuny/otrs.git /opt/znuny/" -s /bin/bash root

RUN cp /opt/znuny/Kernel/Config.pm.dist /opt/znuny/Kernel/Config.pm

RUN cp /opt/znuny/var/cron/aaa_base.dist /opt/znuny/var/cron/aaa_base

RUN cp /opt/znuny/var/cron/znuny_daemon.dist /opt/znuny/var/cron/znuny_daemon

COPY Hostname.pm /opt/znuny/Kernel/Config/Files/

RUN su -c "chmod 777 /opt/znuny/ -R" root /bin/bash

CMD ["/bin/sh"]