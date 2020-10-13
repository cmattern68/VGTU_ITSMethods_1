#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo -e "Script must be run as root"
	exit 1
fi

apt update && apt upgrade
apt install libpam-pwquality

echo ""
echo "###########################################"
echo "#                                         #"
echo "#     Task 1 Generate Users & Groups      #"
echo "#                                         #"
echo "###########################################"
echo ""

# Create Groups and Base Directory
groupadd "sysadm"
mkdir -m 751 /home/sysadm

groupadd "ceo"
mkdir -m 751 /home/ceo

groupadd "administration"
mkdir -m 751 /home/administration
chown root:administration /home/administration

groupadd "managers"
mkdir -m 751 /home/managers
chown root:managers /home/managers

echo "Groups created."

# Setup Directories ACLs
setfacl -d -m g:ceo:rwX /home/*
setfacl -d -m g:sysadm:r-X /home/administration
setfacl -d -m g:sysadm:r-X /home/managers
setfacl -d -m g:administration:rwX /home/administration
setfacl -d -m g:administration:r-X /home/managers
setfacl -d -m g:managers:rwX /home/managers

echo "Permissions Set."

# Create Users and set Groups
useradd -d /home/sysadm -g sysadm -G root,administration,managers "Admin"
chown Admin:sysadm /home/sysadm
echo "Admin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

useradd -d /home/ceo -g ceo -G administration,managers "Chief"
chown Chief:ceo /home/ceo

useradd -m -b /home/administration -g administration -G managers "Alice"

useradd -m -b /home/administration  -g administration -G managers "Gabi"

useradd -m -b /home/managers -g managers "Anthony"

useradd -m -b /home/managers -g managers "Elisa"

useradd -m -b /home/managers -g managers "Jolie"

useradd -m -b /home/managers -g managers "Tom"

echo "Users created."

# Create General & Special Directory

mkdir -m 771 /common
setfacl -d -m g:ceo:rwX /common
setfacl -d -m g:sysadm:rwX /common
setfacl -d -m g:administration:rwX /common
setfacl -d -m g:managers:rwX /common

mkdir -m 700 /special
setfacl -m user:Tom:rwX /special
setfacl -m user:Alice:rwX /special
# A qui on donne les droits ?

echo "Common and Special directories created."

echo ""
echo "###########################################"
echo "#                                         #"
echo "#       Task 2: Pemission to CEO Dir      #"
echo "#                                         #"
echo "###########################################"
echo ""

setfacl -m user:Alice:rw- /home/ceo

echo "Accountant Alice has been provied rw access to /home/ceo."

echo ""
echo "###########################################"
echo "#                                         #"
echo "#         Task 3: Password Policy         #"
echo "#                                         #"
echo "###########################################"
echo ""

# https://linuxhint.com/secure_password_policies_ubuntu/

cp /etc/pam.d/common-password /etc/pam.d/common-password.backup
cp /etc/login.defs /etc/login.defs.backup
sed -i "s/password	requisite			pam_pwquality.so retry=3/password	requisite	pam_cracklib.so reject_username retry=5 minlength=8 lcredit=1 ucredit=1 dcredit=1 ocredit=1/" /etc/pam.d/common-password
sed -i "s/PASS_MAX_DAYS	99999/PASS_MAX_DAYS 30/" /etc/login.defs

echo "Password policy set: 5 retry, minimul length: 8, 1 lowercase, 1 upercase, 1 digit, 1 symbol, and the password cannot contain the username, password max age is 30 days."

echo ""
echo "###########################################"
echo "#                                         #"
echo "#            Task 4: Prohibit             #"
echo "#                                         #"
echo "###########################################"
echo ""

echo ""
echo "###########################################"
echo "#                                         #"
echo "#         Task 5: Event Logging           #"
echo "#                                         #"
echo "###########################################"
echo ""


echo ""
echo "###########################################"
echo "#                                         #"
echo "#         Task 6:                         #"
echo "#                                         #"
echo "###########################################"
echo ""

echo ""
echo "###########################################"
echo "#                                         #"
echo "#         Task 7:                         #"
echo "#                                         #"
echo "###########################################"
echo ""

echo ""
echo "###########################################"
echo "#                                         #"
echo "#                Task 8:                  #"
echo "#                                         #"
echo "###########################################"
echo ""

echo ""
echo "###########################################"
echo "#                                         #"
echo "#                 Enjoy !                 #"
echo "#                                         #"
echo "###########################################"
echo ""
