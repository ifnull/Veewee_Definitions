# Remove some group packages
yum -y groupremove "Additional Development"
yum -y groupremove "E-mail server"
yum -y groupremove "Network file system client"
yum -y groupremove "Perl Support"
yum -y groupremove "Scalable Filesystems"
yum -y groupremove "Storage Availability Tools"
yum -y groupremove "iSCSI Storage Client"

# Run bleachbit
yum install -y -q gnome-python2-gnomevfs pygtk2 python-simplejson redhat-rpm-config usermode
cd /tmp
wget  http://katana.oooninja.com/bleachbit/sf/bleachbit-1.0-1.1.centosCentOS-6.noarch.rpm
rpm -Uvh bleachbit-1.0-1.1.centosCentOS-6.noarch.rpm
bleachbit -c yum.clean_all yum.vacuum system.cache system.localizations
rm -f /tmp/bleachbit-1.0-1.1.centosCentOS-6.noarch.rpm
cd ~

# Remove more packages
yum -y -q remove bluez-libs pwlib boost cscope ctags doxygen squid spamassassin pilot-link gdb gcc-java libgcj libgcj-devel valgrind valgrind-callgrind jessie synaptics cadaver bluez-bluefw emacs emacs-common emacs-leim emacspeak abyssinica-fonts cjkuni-fonts-common jomolhari-fonts khmeros-fonts-common kurdit-unikurd-web-fonts klug-fonts lohit-assamese-fonts lohit-bengali-fonts lohit-devanagari-fonts lohit-gujarati-fonts lohit-kannada-fonts lohit-oriya-fonts lohit-punjabi-fonts lohit-tamil-fonts lohit-telugu-fonts madan-fonts paktype-fonts-common sil-padauk-fonts smc-fonts-common thai-scalable-fonts-common thai-scalable-waree-fonts tibetan-machine-uni-fonts un-core-dotum-fonts un-core-fonts-common vlgothic-fonts-common wqy-zenhei-fonts m17n-contrib-assamese m17n-contrib-bengali m17n-contrib-gujarati m17n-contrib-hindi m17n-contrib-kannada m17n-contrib-maithili m17n-contrib-malayalam m17n-contrib-marathi m17n-contrib-oriya m17n-contrib-punjabi m17n-contrib-sinhala m17n-contrib-tamil m17n-contrib-telugu m17n-contrib-urdu pulseaudio webalizer mysql* gcc-c++ cpp selinux-policy libstdc++-devel bleachbit gnome-python2-gnomevfs pygtk2 python-simplejson redhat-rpm-config usermode
rpm -e --nodeps redhat-logos

# Package cleanup
yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts perl gcc gcc-c++ cpp
package-cleanup --quiet --leaves | xargs yum remove -y
yum -y remove yum-utils
yum -y clean all

rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo
rm -rf VBoxGuestAdditions_*.iso

# Remove traces of mac address from network configuration
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-eth0
rm /etc/udev/rules.d/70-persistent-net.rules

# Kill logs
truncate -s 0 /var/log/*.{log,syslog}
truncate -s 0 /var/log/{dmesg,lastlog,secure,messages,maillog,wtmp}
