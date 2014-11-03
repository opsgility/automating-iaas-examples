$subscription = "[subscription name]"
$storageAccount = "[storage account name]"
$serviceName = "[cloud service name]"
$vmName = "ps-vm1"

Select-AzureSubscription $subscription

$source = "C:\VHDFiles\mydatadisk.vhd"
$destination = "https://$storageAccount.blob.core.windows.net/upload/mydatadisk.vhd"

Add-AzureVHD -LocalFilePath $source -Destination $destination

Add-AzureDisk -DiskName "mydatadisk" -MediaLocation $destination

Get-AzureVM -ServiceName $serviceName -Name $vmName |
    Add-AzureDataDisk -Import -DiskName "mydatadisk" -LUN 1 |
    Update-AzureVM