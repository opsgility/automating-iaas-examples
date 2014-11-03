# Replace with your own subscription name
$subscription = "[subscription name]"

Select-AzureSubscription $subscription

# Replace with your cloud service name
$serviceName = "[cloud service name]"

# Stop all virtual machines in the cloud service
Get-AzureVM -ServiceName $serviceName | Stop-AzureVM -Force


Get-AzureVM -ServiceName $serviceName -Name vnetjoinedvm1 |
    Set-AzureStaticVNetIP -IPAddress "10.20.1.4" |
    Update-AzureVM

Get-AzureVM -ServiceName $serviceName -Name vnetjoinedvm2 |
    Set-AzureStaticVNetIP -IPAddress "10.20.1.5" |
    Update-AzureVM

Get-AzureVM -ServiceName $serviceName -Name vnetjoinedvm3 |
    Set-AzureStaticVNetIP -IPAddress "10.20.1.6" |
    Update-AzureVM

Get-AzureVM -ServiceName $serviceName -Name vnetjoinedvm4 |
    Set-AzureStaticVNetIP -IPAddress "10.20.1.7" |
    Update-AzureVM


# Regardless of the start order, the virtual machines will have
# the correct IP addresses
Start-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm4"
Start-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm1"
Start-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm2"
Start-AzureVM -ServiceName $serviceName -Name "vnetjoinedvm3"