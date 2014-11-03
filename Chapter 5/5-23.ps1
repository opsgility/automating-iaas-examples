$mediaLocation = "https://$storageAccount.blob.windows.net/upload/myosdisk.vhd"

Add-AzureDisk -DiskLabel "My OS disk" -MediaLocation $mediaLocation -OS Windows