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
rm -fR /lib/modules/`uname -r`/kernel/drivers/{usb,gpu,net/wireless,scsi/fcoe,bluetooth,pcmcia,infiniband,isdn,firewire,ieee802154}

# Remove docs
rm -fR /usr/share/doc/{a..z}*/*

# Kill logs
truncate -s 0 /var/log/*.{log,syslog}
truncate -s 0 /var/log/{dmesg,lastlog,secure,messages,maillog,wtmp}

# Remove services
SERVICES="anacron atd auditd blk-availability bluetooth cpuspeed cups dkms_autoinstaller fcoe gpm hidd ip6tables irda iscsi iscsid lldpad lvm2-monitor mdmonitor mdmpd netfs NetworkManager NetworkManagerDispatcher nfslock pcscd portmap postfix rawdevices rpcbind rsyslog smartd udev-post yum-updatesd"
for i in $SERVICES; do service $i stop; chkconfig $i off; done

exit 0;