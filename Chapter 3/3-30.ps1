$serviceName = "[cloud service name]"

$vmName = "ps-vm1"

$vmConfig = Get-AzureVM -ServiceName $serviceName -Name $vmName

$vmConfig | Remove-AzureEndpoint -Name "RemoteDesktop"

$vmConfig | Update-AzureVM