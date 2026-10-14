#Challenge06 Flag Local  Services

$serviceNames = @('EventLog', 'W32Time', 'Spooler')
$reviewCount = 0

foreach ($name in $serviceNames) {
    $service = Get-Service -Name $name

    if ($serice.Status -eq 'Running') {
        Write-Output "OK: $($service.Name)" 
    } else {
        Write-Output "REVIEW : $($service.Name) | $($service.Status)"
        $reviewCount = $reviewCount + 1
    }
}

Write-Output "Total REVIEW: $reviewCount"