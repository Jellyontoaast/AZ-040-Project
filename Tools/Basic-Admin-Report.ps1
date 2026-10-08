#Exercise 1
Get-CimInstance -ClassName Win32_ComputerSystem

#Exercise 2
Get-CimInstance -ClassName Win32_ComputerSystem |
    Select-Object Name, Manufacturer, Model, Domain

#Exercise 3
$system = Get-CimInstance -ClassName Win32_ComputerSystem
$system

$system.Name
$system.Manufacturer
$system.Model
$system.Domain

$system | Select-Object Name, Model

#Exercise 4
$system | Get-Member -MemberType Property

$system.NumberOfLogicalProcessors

$computerReport = $system |
    Select-Object Name, Manufacturer, Model, Domain,
                      NumberOfLogicalProcessors
$computerReport
                    
#Exercise 5
$bios = Get-CimInstance -ClassName Win32_BIOS
$bios

$bios.Manufacturer
$bios.SMBIOSBIOSVersion
$bios.SerialNumber

$biosReport = $bios |
    Select-Object Manufacturer, SMBIOSBIOSVersion, SerialNumber
    $biosReport

#Exercise 6
$reportProperties = @{
    ComputerName      = $system.Name
    Manufacturer      = $system.Manufacturer    
    Model             = $system.Model
    Domain            = $system.Domain
    LogicalProcessors = $system.NumberOfLogicalProcessors
    BIOSManufacturer  = $bios.Manufacturer
    BIOSVersion       = $bios.SMBIOSBIOSVersion
    SerialNumber      = $bios.SerialNumber
}
$reportProperties

$reportProperties['ComputerName']

#Exercise 7
$adminReport = [pscustomobject]$reportProperties
$adminReport

$adminReport | Get-Member -MemberType NoteProperty
$adminReport.ComputerName
$adminReport | Select-Object ComputerName, Model, BIOSVersion

#Exercise 8
$reportFolder = $env:USERPROFILE
$reportFolder

$adminReport |
  Export-Csv "$reportFolder\AdminReport.csv" -NoTypeInformation

Import-Csv "$reportFolder\AdminReport.csv"

