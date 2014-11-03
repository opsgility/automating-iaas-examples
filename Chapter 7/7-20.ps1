Get-AzureVM -ServiceName $serviceName | 
    Remove-AzureVM -DeleteVHD
