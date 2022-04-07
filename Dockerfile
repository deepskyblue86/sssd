FROM amazonlinux:2

RUN yum -y install sssd && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY sssd.conf /conf/sssd.conf

ENTRYPOINT ["/usr/sbin/sssd", "-c", "/conf/sssd.conf", "-i"]
