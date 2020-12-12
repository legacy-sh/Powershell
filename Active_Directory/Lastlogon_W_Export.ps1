Import-Module ActiveDirectory

Get-ADUser -Filter {Enabled -eq $true} -Properties Name,Manager,LastLogon | Select-Object Name,Manager,@{n='LastLogon';e={[DateTime]::FromFileTime($_.LastLogon)}} | Start-Transcript -path ~\Desktop\export.txt -Append | Stop-Transcript
