$serviceName = "[cloud service name]"

$vmName = "ps-vm1"

# Return the VM configuration (contains the endpoint configuration)
$vmConfig = Get-AzureVM -ServiceName $serviceName -Name $vmName