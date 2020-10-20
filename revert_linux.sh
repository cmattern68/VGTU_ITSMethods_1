#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo -e "The script must be run as root"
	exit 1
fi

userdel Admin
userdel Chief
userdel Alice
userdel Gabi
userdel Anthony
userdel Elisa
userdel Jolie
userdel Tom

rm -rf /home/administration
rm -rf /home/managers
rm -rf /home/ceo
rm -rf /home/sysadm
rm -rf /common
rm -rf /special

delgroup sysadm
delgroup ceo
delgroup administration
delgroup managers

cp /etc/pam.d/common-password.backup /etc/pam.d/common-password
rm /etc/pam.d/common-password.backup

cp /etc/login.defs.backup /etc/login.defs
rm /etc/login.defs.backup

cp /etc/rsyslog.conf.backup /etc/rsyslog.conf
rm /etc/rsyslog.conf.backup

cp /etc/sudoers.backup /etc/sudoers
rm /etc/sudoers.backup
