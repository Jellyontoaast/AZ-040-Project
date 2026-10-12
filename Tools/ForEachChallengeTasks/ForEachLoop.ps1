#Task1
$Numbers = 1,2,3,4,5,6
foreach ($Num in $Numbers) {Write-Output $Num}
foreach ($num in $numbers) {Write-Output ($num * 6)}

#Task2
$files = Get-ChildItem -Path 'E:\Mod07\Labfiles'
foreach ($file in $files) {Write-Output $file.Name}

#Task3
New-ADOrganizationalUnit -Name 'Disabled Users'

#Task4
Get-ADUser -SearchBase "OU=Marketing,DC=Adatum,DC=com" -Filter "Name -like 'A*'" | ForEach-Object {
    Disable-ADAccount -Identity $_.DistinguishedName}
    
Move-ADObject -Identity "CN=Annie Conner,OU=Marketing,DC=Adatum,DC=com" `
    -TargetPath "OU=IT,DC=Adatum,DC=com"

#Task5
Get-ADUser -SearchBase "OU=Marketing,DC=Adatum,DC=com" -Filter {
        Enabled -eq $false -and
            Department -ne "Marketing" -and
                Department -ne "IT" -and
                    Name -ne "Annie Conner"
                    }
$users = Get-ADUser -Filter {Department -eq 'Marketing' -and Enabled -eq $false} -SearchBase "OU=Marketing,DC=Adatum,DC=com"
foreach ($user in $users) {
    IF ($user.enabled -eq $false) {

#Task6
$users


#Task7
ForEach ($user in $users) {
IF ($user.Enabled -eq $false) {
     $user | Move-ADObject -TargetPath "OU=Disabled Users,DC=Adatum,DC=com"
}
}
#Task8
Get-ADUser -Filter -SearchBase

#Task9
    

 