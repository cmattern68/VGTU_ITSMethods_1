#functions

function fakeLogon($name) {
    runas /user:$name echo "Home created for " + $name + "."
}

#end functions

$prompt= Read-Host -Prompt 'Is Microsoft Management Framework install ? (y/n)'

if ($prompt -eq 'n') {
    echo "You can download it at https://www.microsoft.com/en-us/download/details.aspx?id=54616"
    echo "this one should work: https://www.microsoft.com/en-us/download/confirmation.aspx?id=54616"
    exit
}

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())


if (!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    echo "Script must me run as root."
    exit
}

echo "" 
echo "###########################################" 
echo "#                                         #" 
echo "#     Task 1 Generate Users & Groups      #" 
echo "#                                         #" 
echo "###########################################" 
echo "" 

New-LocalGroup -Name "sysadm"
New-LocalGroup -Name "ceo"
New-LocalGroup -Name "administration"
New-LocalGroup -Name "managers"

New-LocalUser -Name "Admini" -NoPassword
Add-LocalGroupMember -Group "Administrators" -Member "Admini"
Add-LocalGroupMember -Group "sysadm" -Member "Admini"
Add-LocalGroupMember -Group "administration" -Member "Admini"
Add-LocalGroupMember -Group "managers" -Member "Admini"
fakeLogon "Admini"

New-LocalUser -Name "Chief" -NoPassword
Add-LocalGroupMember -Group "sysadm" -Member "Chief"
Add-LocalGroupMember -Group "ceo" -Member "Chief"
Add-LocalGroupMember -Group "administration" -Member "Chief"
Add-LocalGroupMember -Group "managers" -Member "Chief"
fakeLogon "Chief"

New-LocalUser -Name "Alice" -NoPassword
Add-LocalGroupMember -Group "administration" -Member "Alice"
Add-LocalGroupMember -Group "managers" -Member "Alice"
fakeLogon "Alice"

New-LocalUser -Name "Gabi" -NoPassword
Add-LocalGroupMember -Group "administration" -Member "Gabi"
Add-LocalGroupMember -Group "managers" -Member "Gabi"
fakeLogon "Gabi"

New-LocalUser -Name "Anthony" -NoPassword
Add-LocalGroupMember -Group "managers" -Member "Anthony"
fakeLogon "Anthony"

New-LocalUser -Name "Elisa" -NoPassword
Add-LocalGroupMember -Group "managers" -Member "Elisa"
fakeLogon "Elisa"

New-LocalUser -Name "Jolie" -NoPassword
Add-LocalGroupMember -Group "managers" -Member "Jolie"
fakeLogon "Jolie"

New-LocalUser -Name "Tom" -NoPassword
Add-LocalGroupMember -Group "managers" -Member "Tom"
fakeLogon "Tom"

echo "" 
echo "###########################################" 
echo "#                                         #" 
echo "#       Task 2: Pemission to CEO Dir      #" 
echo "#                                         #" 
echo "###########################################" 
echo "" 

echo ""
echo "###########################################"
echo "#                                         #"
echo "#         Task 3: Password Policy         #"
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
echo "#           Task 6: Ownership             #"
echo "#                                         #"
echo "###########################################"
echo ""

echo ""
echo "###########################################"
echo "#                                         #"
echo "#        Task 8: Record Systems           #"
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