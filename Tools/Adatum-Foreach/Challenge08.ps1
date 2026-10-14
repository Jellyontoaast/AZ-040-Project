#Challenge8 Test Network Responses

$computers = @('LoN-CL1', 'LON-DC1', 'LON-SVR1')
$domain = 'adatum.com'
$replyCount = 0

foreach ($computer in $computers) {
    $fqdn = "$computer.$domain"
    $result = Test-Connection -ComputerName $fqdn -Count 1 -Quiet -ErrorAction SilentlyContinue

    if ($result) {
        write-output "$fqdn : ICMP reply"
        $replyCount++
    } else {
        write-output "$fqdn : ICMP no reply"
    }
}

Write-Output "Total ICMP replies: $replyCount"