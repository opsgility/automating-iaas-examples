Get-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm4" |
    Set-AzureSubnet -SubnetNames "DCSubnet" |
    Update-AzureVM 