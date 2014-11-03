$vmConfig = Get-AzureVM -ServiceName $serviceName -Name $vmName 

$vmConfig | Set-AzureOSDisk -HostCaching ReadOnly

$vmConfig | Set-AzureDataDisk -LUN 0 -HostCaching ReadWrite

$vmConfig | Set-AzureDataDisk -LUN 1 -HostCaching ReadWrite

$vmConfig | Update-AzureVM