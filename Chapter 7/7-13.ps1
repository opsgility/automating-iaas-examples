$serviceName  = "[cloud service name]"
$vmName = "[VM name]"

$vmConfig = Get-AzureVM -ServiceName $serviceName -Name $vmName

$vmConfig | Set-AzureVMAccessExtension

$vmConfig | Update-AzureVM