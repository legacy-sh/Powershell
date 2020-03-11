# Written by Edwin Romero https://github.com/legacy-sh
#
# This command search for all computers under a specific OU then Outputs their name and the ms-MCs-AdmPwd value. Finally it exports the output to a file called Export.txt to your Desktop.
#
# Value(s) that you can change to make it more convenient for you:
# -SearchBase "OU=WhereYourComputersAreLocated,DC=YourDomain,DC=LOCAL"
# OutFile -FilePath \WhereYouWant\Your\File\ToBe\Saved

Get-ADComputer -Filter * -SearchBase "OU=NASA Computers,OU=NASA,OU=ISS,DC=INFINTY,DC=LOCAL -Properties ms-MCs-AdmPwd | select name, ms-MCs-AdmPwd | OutFile -FilePath ~\Desktop\Export.txt