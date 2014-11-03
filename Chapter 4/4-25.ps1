Get-AzureVM -ServiceName $serviceName -Name $vmName | 
    Remove-AzurePublicIP -PublicIPName "$vmName-IP" |
    Update-AzureVM 