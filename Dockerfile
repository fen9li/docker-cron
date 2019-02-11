FROM centos:7
LABEL maintainer="lifcn@yahoo.com"

# activate systemd

ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]

#CMD ["/usr/sbin/init"]
#CMD ["/usr/bin/bash"]

RUN yum -y update; yum -y install cronie
ADD crontab /etc/cron.d/c1-cron
RUN chmod 0644 /etc/cron.d/c1-cron
ADD c1-cron.sh /root/c1-cron.sh
RUN chmod +x /root/c1-cron.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log
ENTRYPOINT [ "/usr/sbin/crond","-n" ]
