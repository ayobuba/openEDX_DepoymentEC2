#!/bin/sh
CMS_BASE=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com)
LMS_BASE=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com)
echo "EDXAPP_CMS_BASE: $CMS_BASE" >> config.yml
echo "EDXAPP_LMS_BASE: $LMS_BASE" >> config.yml
sudo wget https://raw.githubusercontent.com/lpm0073/edx.scripts/master/edx.platform-install.sh
sudo chmod 755 edx.platform-install.sh
sudo ./edx.platform-install.sh





sudo dpkg-reconfigure locales