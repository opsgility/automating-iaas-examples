$mediaLocation = "https://$storageAccount.blob.windows.net/upload/mydatadisk.vhd"

$vmConfig | Add-AzureDataDisk -ImportFrom `
                              -DiskLabel "imported vhd" `
                              -LUN 0 `
                              -MediaLocation $mediaLocation