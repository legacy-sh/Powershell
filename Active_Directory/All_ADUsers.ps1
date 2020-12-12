# List of all AD Users

Import-Module ActiveDirectory

Get-ADUser -Filter * | FT Enabled,Name,DistinguishedName > ~\Desktop\ADUser.txt
