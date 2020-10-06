#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo -e "Script must be run as root"
	exit 1
fi

echo ""
echo "###########################################"
echo "#                                         #"
echo "#         Generate Users & Groups         #"
echo "#                                         #"
echo "###########################################"
echo ""

addgroup "sysadm"
addgroup "ceo"
addgroup "administration"
addgroup "managers"

mkdir /home/administration/
mkdir /home/managers/

useradd -m -g sysadm -G root,administration,managers "Admin"
echo "Admin:6FD9Fy" | chpasswd
chage -d 0 Admin

useradd -m -g ceo -G administration,managers "Chief"
echo "Chief:6=D9Fy" | chpasswd
chage -d 0 Chief

useradd -m -d "/home/administration/alice" -g administration -G managers "Alice"
echo "Alice:6FD9Fy" | chpasswd
chage -d 0 Alice

useradd -m -d "/home/administration/gabi"  -g administration -G managers "Gabi"
echo "Gabi:6FD9Fy" | chpasswd
chage -d 0 Gabi

useradd -m -d "/home/managers/anthony" -g managers "Anthony"
echo "Anthony:6FD9Fy" | chpasswd
chage -d 0 Anthony

useradd -m -d "/home/managers/elisa" -g managers "Elisa"
echo "Elisa:6FD9Fy" | chpasswd
chage -d 0 Elisa

useradd -m -d "/home/managers/jolie" -g managers "Jolie"
echo "Jolie:6FD9Fy" | chpasswd
chage -d 0 Jolie

useradd -m -d "/home/managers/tom" -g managers "Tom"
echo "Tom:6FD9Fy" | chpasswd
chage -d 0 Tom

echo ""
echo "###########################################"
echo "#                                         #"
echo "#     Create Shared Folder & Set ACLs     #"
echo "#                                         #"
echo "###########################################"
echo ""

chgrp "administration"  /home/administration/
chgrp "managers" /home/managers/
chgrp "sysadm" /home/Admin/
chgrp "ceo" /home/Chief/

chmod 740 /home/administration/
chmod 740 /home/managers/
chmod 740 /home/Admin/
chmod 740 /home/Chief/
