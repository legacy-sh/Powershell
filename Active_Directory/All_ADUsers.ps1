# List of all AD Users

Install-Module -Name ActiveDirectory
Import-Module ActiveDirectory

Get-ADUser -Filter * -Properties Enabled,Name,DistinguishedName | ~\Desktop\ADUser.txt
