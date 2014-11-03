# Replace with your cloud service name
$serviceName = "[cloud service name]"

# Stop all virtual machines in the cloud service
Get-AzureVM -ServiceName $serviceName | Stop-AzureVM -Force


Start-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm4"
Start-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm1"
Start-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm2"
Start-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm3"