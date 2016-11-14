#!/bin/bash

TLS_LISTEN=${TLS_LISTEN-0}
TLS_PORT=${TLS_PORT-16514}

TCP_LISTEN=${TCP_LISTEN-1}
TCP_PORT=${TCP_PORT-16509}
AUTH_TCP=${AUTH_TCP-none}

dnf install -y \
    libvirt-daemon-driver-* \
    libvirt-daemon \
    libvirt-daemon-kvm \
    qemu-kvm

systemctl enable libvirtd
systemctl enable virtlockd 

# Enable TCP only if client not included
if [ -z ${INCLUDECLIENT} ]; then
    cat >> /etc/libvirt/libvirtd.conf << EOF
listen_tls = 0
listen_tcp = 1
tls_port = "${TLS_PORT}"
tcp_port = "${TCP_PORT}"
auth_tcp = "${AUTH_TCP}"
EOF
    echo 'LIBVIRTD_ARGS="--listen"' >> /etc/sysconfig/libvirtd
else
    dnf install -y virt-viewer virt-install libvirt-client
fi

# Edit the service file which includes ExecStartPost to chmod /dev/kvm
sed -i "/Service/a ExecStartPost=\/bin\/chmod 666 /dev/kvm" /usr/lib/systemd/system/libvirtd.service

mkdir -p /var/lib/libvirt/images/
