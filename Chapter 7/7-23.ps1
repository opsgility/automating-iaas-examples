$serviceName = "[cloud service name]"
$vmName = "ps-vm1"
$localPath = "C:\Scripts\$vmName.xml"

Export-AzureVM -ServiceName $serviceName -Name $vmName -Path $localPath