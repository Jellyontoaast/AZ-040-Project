#Challenge4 Count Local Services

$services = @(Get-Service)
$total = 0

foreach ($service in $services) {
    write-output $($service.Name)        
    $total = $total + 1
}

write-output "Total Services: $total"