Get-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm4" |
    Remove-AzureStaticVNetIP |
    Update-AzureVM 