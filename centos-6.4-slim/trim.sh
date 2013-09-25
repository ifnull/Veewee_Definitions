# Install YUM utils
yum -y install wget yum-utils

# Remove non-english locales
rm /usr/lib/locale/locale-archive; ln -s /usr/lib/locale/locale-archive-rpm /usr/lib/locale/locale-archive
localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8

# Remove kernel modules
for i in $(find /lib/modules/`uname -r`/kernel/drivers/net/wireless -name "*.ko" -type f) ; do echo blacklist $i >> /etc/modprobe.d/blacklist-wireless.conf ; done
for i in $(find /lib/modules/`uname -r`/kernel/drivers/scsi/fcoe -name "*.ko" -type f) ; do echo blacklist $i >> /etc/modprobe.d/blacklist-fcoe.conf ; done
for i in $(find /lib/modules/`uname -r`/kernel/drivers/bluetooth -name "*.ko" -type f) ; do echo blacklist $i >> /etc/modprobe.d/blacklist-bluetooth.conf ; done
for i in $(find /lib/modules/`uname -r`/kernel/drivers/pcmcia -name "*.ko" -type f) ; do echo blacklist $i >> /etc/modprobe.d/blacklist-pcmcia.conf ; done
for i in $(find /lib/modules/`uname -r`/kernel/drivers/infiniband -name "*.ko" -type f) ; do echo blacklist $i >> /etc/modprobe.d/blacklist-infiniband.conf ; done
for i in $(find /lib/modules/`uname -r`/kernel/drivers/isdn -name "*.ko" -type f) ; do echo blacklist $i >> /etc/modprobe.d/blacklist-isdn.conf ; done
for i in $(find /lib/modules/`uname -r`/kernel/drivers/firewire -name "*.ko" -type f) ; do echo blacklist $i >> /etc/modprobe.d/blacklist-firewire.conf ; done
for i in $(find /lib/modules/`uname -r`/kernel/drivers/ieee802154 -name "*.ko" -type f) ; do echo blacklist $i >> /etc/modprobe.d/blacklist-ieee802154.conf ; done
rm -fR /lib/modules/`uname -r`/kernel/drivers/usb
rm -fR /lib/modules/`uname -r`/kernel/drivers/gpu
rm -fR /lib/modules/`uname -r`/kernel/drivers/net/wireless
rm -fR /lib/modules/`uname -r`/kernel/drivers/scsi/fcoe
rm -fR /lib/modules/`uname -r`/kernel/drivers/bluetooth
rm -fR /lib/modules/`uname -r`/kernel/drivers/pcmcia
rm -fR /lib/modules/`uname -r`/kernel/drivers/infiniband
rm -fR /lib/modules/`uname -r`/kernel/drivers/isdn
rm -fR /lib/modules/`uname -r`/kernel/drivers/firewire
rm -fR /lib/modules/`uname -r`/kernel/drivers/ieee802154

# Remove docs
rm -f /usr/share/doc/a*/*
rm -f /usr/share/doc/b*/*
rm -f /usr/share/doc/c*/*
rm -f /usr/share/doc/d*/*
rm -f /usr/share/doc/e*/*
rm -f /usr/share/doc/f*/*
rm -f /usr/share/doc/g*/*
rm -f /usr/share/doc/h*/*
rm -f /usr/share/doc/i*/*
rm -f /usr/share/doc/j*/*
rm -f /usr/share/doc/k*/*
rm -f /usr/share/doc/l*/*
rm -f /usr/share/doc/m*/*
rm -f /usr/share/doc/n*/*
rm -f /usr/share/doc/o*/*
rm -f /usr/share/doc/p*/*
rm -f /usr/share/doc/p*/*
rm -f /usr/share/doc/q*/*
rm -f /usr/share/doc/r*/*
rm -f /usr/share/doc/s*/*
rm -f /usr/share/doc/t*/*
rm -f /usr/share/doc/u*/*
rm -f /usr/share/doc/v*/*
rm -f /usr/share/doc/w*/*
rm -f /usr/share/doc/x*/*
rm -f /usr/share/doc/y*/*
rm -f /usr/share/doc/z*/*

# Remove services
SERVICES="fcoe yum-updatesd rawdevices iscsi iscsid auditd blk-availability dkms_autoinstaller ip6tables iptables iscsi iscsid lldpad lvm2-monitor mdmonitor netfs nfslock postfix rpcbind rsyslog udev-post"
for i in $SERVICES; do service $i stop; chkconfig $i off; done
