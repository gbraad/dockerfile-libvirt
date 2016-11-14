FROM registry.gitlab.com/gbraad/fedora:24
MAINTAINER Gerard Braad <me@gbraad.nl>

# configure and install libvirt client
RUN dnf update -y && \
    dnf install -y \
    virt-viewer virt-install libvirt-client && \
    dnf clean all && \
    echo 'uri_default = "qemu+tcp://libvirtd/system"' >> /etc/libvirt/libvirt.conf

VOLUME ["/var/lib/libvirt/"]

CMD ["/usr/bin/virsh"]
