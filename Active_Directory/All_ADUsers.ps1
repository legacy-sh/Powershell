# List of all AD Users

Install-Module -Name Active Directory
Import-Module ActiveDirectory

Get-ADUser -Filter * -Properties Enabled,Name,DistinguishedName | ~\Desktop\ADUser.txt