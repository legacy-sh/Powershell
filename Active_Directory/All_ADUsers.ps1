# List of all AD Users

Import-Module ActiveDirectory

Get-ADUser -Filter * -Properties Enabled,Name,DistinguishedName | ~\Desktop\ADUser.txt
