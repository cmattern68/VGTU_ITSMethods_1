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

Remove-LocalUser -Name "Admini"
Remove-LocalUser -Name "Chief"
Remove-LocalUser -Name "Alice"
Remove-LocalUser -Name "Gabi"
Remove-LocalUser -Name "Anthony"
Remove-LocalUser -Name "Elisa"
Remove-LocalUser -Name "Jolie"
Remove-LocalUser -Name "Tom"

Remove-LocalGroup -Name "sysadm"
Remove-LocalGroup -Name "ceo"
Remove-LocalGroup -Name "administration"
Remove-LocalGroup -Name "managers"