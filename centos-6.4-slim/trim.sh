# Install YUM utils
yum -y install wget yum-utils

# Run bleachbit
yum install -y -q gnome-python2-gnomevfs pygtk2 python-simplejson redhat-rpm-config usermode
cd /tmp
wget  http://katana.oooninja.com/bleachbit/sf/bleachbit-0.9.6-1.1.centosCentOS-6.noarch.rpm
rpm -Uvh bleachbit-0.9.6-1.1.centosCentOS-6.noarch.rpm 
bleachbit -c yum.clean_all yum.vacuum system.cache system.localizations
rm -f /tmp/bleachbit-0.9.6-1.1.centosCentOS-6.noarch.rpm
yum remove -y bleachbit gnome-python2-gnomevfs pygtk2 python-simplejson redhat-rpm-config usermode
cd ~

# Remove non-english locales
rm /usr/lib/locale/locale-archive; ln -s /usr/lib/locale/locale-archive-rpm /usr/lib/locale/locale-archive
localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8

# Remove some group packages
yum -y groupremove "Additional Development"
yum -y groupremove "E-mail server"
yum -y groupremove "Network file system client"
yum -y groupremove "Perl Support"
yum -y groupremove "Scalable Filesystems"
yum -y groupremove "Storage Availability Tools"
yum -y groupremove "iSCSI Storage Client"

# Remove more packages
yum -y -q remove bluez-libs pwlib boost cscope ctags doxygen squid spamassassin pilot-link gdb gcc-java libgcj libgcj-devel valgrind valgrind-callgrind jessie synaptics cadaver bluez-bluefw emacs emacs-common emacs-leim emacspeak abyssinica-fonts cjkuni-fonts-common jomolhari-fonts khmeros-fonts-common kurdit-unikurd-web-fonts klug-fonts lohit-assamese-fonts lohit-bengali-fonts lohit-devanagari-fonts lohit-gujarati-fonts lohit-kannada-fonts lohit-oriya-fonts lohit-punjabi-fonts lohit-tamil-fonts lohit-telugu-fonts madan-fonts paktype-fonts-common sil-padauk-fonts smc-fonts-common thai-scalable-fonts-common thai-scalable-waree-fonts tibetan-machine-uni-fonts un-core-dotum-fonts un-core-fonts-common vlgothic-fonts-common wqy-zenhei-fonts m17n-contrib-assamese m17n-contrib-bengali m17n-contrib-gujarati m17n-contrib-hindi m17n-contrib-kannada m17n-contrib-maithili m17n-contrib-malayalam m17n-contrib-marathi m17n-contrib-oriya m17n-contrib-punjabi m17n-contrib-sinhala m17n-contrib-tamil m17n-contrib-telugu m17n-contrib-urdu pulseaudio webalizer mysql* gcc-c++ cpp selinux-policy libstdc++-devel
rpm -e --nodeps redhat-logos

# Package cleanup
package-cleanup --quiet --leaves | xargs yum remove -y
yum -y remove yum-utils wget
yum clean all

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
