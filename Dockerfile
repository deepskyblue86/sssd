FROM amazonlinux:2

LABEL usage="docker run -d --privileged --name sssd -v /etc:/etc:ro -v /var/lib/sss:/var/lib/sss ghcr.io/deepskyblue86/sssd:latest"

RUN yum -y install sssd && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY sssd.conf /conf/sssd.conf

# backup sss_statedir
RUN cp -r /var/lib/sss /sss_statedir

COPY entrypoint.sh /

ENTRYPOINT ["./entrypoint.sh"]
