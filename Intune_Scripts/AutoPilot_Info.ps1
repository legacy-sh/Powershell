# Written by Edwin Romero https://github.com/legacy-sh
#
# This script is meant to export the hardware hash and the serial number the device running the script.
# The hardware hash and serial number is suppose to get import to Microsoft Intune.
#
$uname = whoami
$split = $uname.split('\')
$uuser = $split[1]
New-Item -Type Directory -Path "C:\HWID"
Set-Location -Path "C:\HWID"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
Install-Script -Name Get-WindowsAutoPilotInfo
Get-WindowsAutoPilotInfo.ps1 -OutputFile \Users\$uuser\Desktop\AutoPilotHWID.csv 