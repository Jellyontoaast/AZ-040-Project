#Challenge10 Remote Service Review

$targets = @('LON-SVR1.Adatum.com')

foreach ($target in $targets) {

    try {
        $services = @(Invoke-Command -ComputerName $target `
            -ErrorAction Stop -ScriptBlock {
                Get-Service -Name 'EventLog','W32Time','Spooler' -ErrorAction Stop
            })

        foreach ($service in $services) {
            if ($service.Status -eq 'Running') {
                Write-Output "$target | OK     | $($service.Name)"
            } else {
                Write-Output "$target | REVIEW | $($service.Name) | $($service.Status)"
            }
        }

    } catch {
        Write-Output "QUERY FAILED: $target | $($_.Exception.Message)"
    }
}
