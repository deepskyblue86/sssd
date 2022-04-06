FROM amazonlinux:2

RUN yum -y install sssd && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY sssd.conf /etc/sssd/

ENTRYPOINT ["/usr/sbin/sssd", "-i"]
