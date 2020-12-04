# Written by Edwin Romero https://github.com/legacy-sh
#
# This script is meant for Windows Server Core. 
# The script will install the available updates and prompt the user if they would like to reboot.

$Update = Start-WUScan
Write-Host "Updates Found: " $Update.Count
Install-WUUpdates -Updates $Update

do {
$Response = Read-Host "Would you like to reboot?"
    if ($Response -eq "Yes") {
        $leave = 1
        Write-Host "Restarting Now!"
        Restart-Computer -Force
    }
    elseif ($Response -eq "No") {
        $leave = 1
        write-host "Not Restarting!"
        exit
    }
    else {
        Write-Host "Invalid Input"
        $leave = 0
    }
}
Until ($leave -eq 1)
