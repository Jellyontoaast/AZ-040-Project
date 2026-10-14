#Challenge2 Build domain qualified names

$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')
$domain = 'adatum.com'

foreach ($computer in $computers) {
    $fqdn = "$computer.$domain"
    Write-Output $fqdn
}