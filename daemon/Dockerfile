FROM registry.gitlab.com/gbraad/fedora:systemd
MAINTAINER Gerard Braad <me@gbraad.nl>

# configure and install libvirtd
ENV TCP_PORT=16509
ADD run_container.sh /tmp/
RUN dnf update -y && \
    /tmp/run_container.sh && \
    dnf clean all

EXPOSE ${TCP_PORT}

VOLUME ["/var/lib/libvirt"]

# start systemd
#CMD ["/usr/sbin/init"]
