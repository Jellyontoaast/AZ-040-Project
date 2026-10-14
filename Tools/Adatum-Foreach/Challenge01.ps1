#Challenge1 List the lab computers

$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')

foreach ($computer in $computers) { Write-Output $computer}