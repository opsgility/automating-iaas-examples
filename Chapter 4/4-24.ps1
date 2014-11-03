Get-AzureVM -ServiceName $serviceName -Name $vmName | 
    Set-AzurePublicIP -PublicIPName "$vmName-IP" |
    Update-AzureVM 