#Challenge9 Export Computer Report

Import-Module ActiveDirectory

$computers = @('LoN-CL1', 'LON-DC1', 'LON-SVR1')

$report = @(foreach ($name in $computers) {
    $ad = Get-ADComputer -Identity $name -Server 'LON-DC1.adatum.com' -Properties OperatingSystem

    $state = if ($ad.Enabled) { 'Enabled' } else { 'Disabled' }     

    [PSCustomObject]@{
        ComputerName = $ad.Name
        DNSHostName = $ad.DNSHostName
        OperatingSystem = $ad.OperatingSystem
        AccountState = $state
    }
})

$fileName = 'Challenge09-' + [guid]::NewGuid() + '.csv'
$path = Join-Path -Path $PSScriptRoot -ChildPath $fileName

$report | Export-Csv -Path $path -NoTypeInformation -Encoding UTF8

Write-Output "Report exported to $path"

#Verify the report was created successfully
$importedReport = Import-Csv -Path $path
write-Output "Imported report contains $($importedReport.Count) records"