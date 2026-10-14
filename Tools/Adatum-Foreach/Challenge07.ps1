#Challenge7 Summarize AD User States

Import-Module ActiveDirectory
$users = @(Get-ADUser -Filter * -Server 'LON-DC1.adatum.com')

$enabled = 0
$disabled = 0

foreach ($user in $users) {
    if ($user.Enabled) {
        Write-Output "$($user.SamAccountName) : Enabled"
        $enabled++
    } else {
        Write-Output "$($user.SamAccountName) : Disabled"
        $disabled++
    }
}

Write-Output "Total Enabled: $enabled"
Write-Output "Total Disabled: $disabled"
Write-Output "Total Users: $($enabled + $disabled)"