$storageAccount = "[storage account name]"
$osdisk = "https://$storageAccount.blob.core.windows.net/upload/myosdrive.vhd"
$osdiskName = "os disk"


$datadisk = "https://$storageAccount.blob.core.windows.net/upload/mydatadrive.vhd"
$datadiskname = "data disk"

# Register the operating system disk
Add-AzureDisk -DiskName $osdiskName -MediaLocation $osdisk -OS Windows

# Register the data disk
Add-AzureDisk -DiskName $datadiskname -MediaLocation $datadisk