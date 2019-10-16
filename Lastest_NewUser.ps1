Import-Module ActiveDirectory

# Grabs users first name

$fname = Read-Host 'Whats the users first name?'

echo $fname

# Grabs users last name

$lname = Read-Host 'Whats the users last name?'

echo $lname

# Grabs users password also, secures the password

$pass = Read-Host 'Whats the users password?' -AsSecureString

# Creates a varible for the intiate

$fname1 = $fname.substring(0,1)

echo $fname1

# Creates a full name varible

$fullname = $fname + " " + $lname

echo $fullname

# Creates the Sam Nmae 

$samname = $fname1 + $lname

echo $samname

# Records the path name

$pathname = Read-Host 'Please enter path name... please add $'

echo $pathname

    $Attributes = @{

    Enable = $true
    Path = "OU=SpaceCadets,OU=InfinityStation,DC=Infinity,DC=org"
    
    Name = "$($fname.First) $($lname.Last)"
    UserPrincipalName = "$($fname.First).$($lname.Last)infinity.corp"
    SamAccountName = "$($fname1.First).$($lname.Last)"

    GivenName = $fname.First
    Surname = $lname.Last

    }

    New-ADuser @Attributes

    New-SmbShare -Name $samname -Path $pathname -ChangeAccess $samname