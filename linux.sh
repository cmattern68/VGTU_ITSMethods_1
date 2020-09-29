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
useradd -m -g ceo -G administration,managers "Chief"
useradd -d "/home/administration/alice" -g administration -G managers "Alice"
useradd -d "/home/administration/gabi"  -g administration -G managers "Gabi"
useradd -d "/home/managers/anthony" -g managers "Anthony"
useradd -d "/home/managers/elisa" -g managers "Elisa"
useradd -d "/home/managers/jolie" -g managers "Jolie"
useradd -d "/home/managers/tom" -g managers "Tom"

echo ""
echo "###########################################"
echo "#                                         #"
echo "#     Create Shared Folder & Set ACLs     #"
echo "#                                         #"
echo "###########################################"
echo ""
