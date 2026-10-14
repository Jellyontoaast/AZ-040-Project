#Challenge5 Read AD Computer Inventory

Import-Module ActiveDirectory

$computers = @('LON-CL1','LON-DC1','LON-SVR1')

foreach ($name in $computers) {
    $ad = Get-ADComputer -Identity $name -Server 'LON-DC1.adatum.com' -Properties 'OperatingSystem'
    Write-Output "$($ad.Name) | $($ad.DNSHostName) | $($ad.OperatingSystem)"
}
