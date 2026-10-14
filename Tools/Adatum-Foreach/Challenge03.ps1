#Challenge3 Inspect local services

$serviceNames = @('EventLog','W32Time','Spooler')

foreach ($name in $serviceNames) {
    $service = Get-Service -Name $name 
    Write-Output "$($service.Name) : $($service.Status)"
}