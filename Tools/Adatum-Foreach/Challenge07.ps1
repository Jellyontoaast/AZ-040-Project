#Challenge7 Summarize AD User States

Import-Module ActiveDirectory
$users = @(Get-ADUser -Filter * -Server 'LON-DC1.adatum.com')

