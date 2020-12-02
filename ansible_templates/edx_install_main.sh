#!/bin/sh
export OPENEDX_RELEASE=open-release/juniper.3
CMS_BASE=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com)
LMS_BASE=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com)
echo "EDXAPP_CMS_BASE: $CMS_BASE" >> config.yml
echo "EDXAPP_LMS_BASE: $LMS_BASE" >> config.yml


#
# Done bootstrapping, edx_ansible is now installed in /edx/app/edx_ansible.
#    Time to run some plays.  Activate the virtual env with
#
#    > . /edx/app/edx_ansible/venvs/edx_ansible/bin/activate
#
