$mediaLocation = "https://$storageAccount.blob.windows.net/upload/mydatadisk.vhd"

Add-AzureDisk -DiskName "MyDataDisk" -MediaLocation $mediaLocation


$vmConfig | Add-AzureDataDisk -Import `
                              -DiskName "MyDataDisk" `
                              -LUN 0