# Written by Edwin Romero https://github.com/legacy-sh
#
# This script will use a list of known good users and constantly compare them
# If a change is found the script will prompt the user

# Find out if the script needs to scan Active Directory or just a local machine

# Getting all local users
function Get-LocalUser_Scan {
# Creates an list of all local users on the machine
# This list will be used as a baseline to other list created during the script
    Get-LocalUser | Format-Table Enabled,Name > ~\Desktop\All_Local_Users.txt
    $leave = 0
    Do {
        # Adds a delay to the loop
        Start-Sleep -s 60
        # Creates a current list of all local users
        Get-LocalUser | Format-Table Enabled,Name > ~\Desktop\Scan$(Get-Date -f HH.mm).txt
        # Compares the basline list to a current list of all local users
        Compare-Object -ReferenceObject (Get-Content -Path ~\Desktop\All_Local_Users.txt) -DifferenceObject (Get-Content -Path ~\Desktop\Scan*) > ~\Desktop\NEW_USERS$(Get-Date -f HH.mm).txt
        # Verifies that there's file name NEW_USERS(Something)
        if (Test-Path -Path ~\Desktop\NEW_USERS* -eq True) 
            {
            $leave = 1
            [System.Windows.MessageBox]::Show('NEW USER(S) DETECTED!!')
            }
        # If there's no file called NEW_USERS(Something)
        # The next line will delete the Scan(current_timestamp) file      
        elseif (Test-Path -Path ~\Desktop\NEW_USERS* -ne True)
            { 
            Remove-Item ~\Desktop\Scan*
            Continue    
            }
        else 
            {
            Write-Host ("Error!")
            }

    } Until ($leave -eq 1)
}

$answ = Read-Host ("Would you like to run a baseline??")

if ($answ -eq "Yes")
{
    Write-Host ("Running Script")
    Start-Sleep -s 3
    Clear
    Get-LocalUser_Scan
}
elseif ($answ -ne "Yes") 
{
    Write-Host ("Okay... Goodbye")    
}
else
{
    Write-Host ("ERROR INVALID INPUT!")
}
