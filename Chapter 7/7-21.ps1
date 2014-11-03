Get-AzureVM -ServiceName $serviceName | 
    Where { $_.Name -like 'iis*'} |  
    Remove-AzureVM -DeleteVHD
