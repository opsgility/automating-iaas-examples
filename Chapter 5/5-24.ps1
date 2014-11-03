$vmConfig | Add-AzureDataDisk -CreateNew `
                            -DiskSizeInGB 50 `
                            -DiskLabel "data 1" `
                            -LUN 0 

$vmConfig | Add-AzureDataDisk -CreateNew `
                            -DiskSizeInGB 50 `
                            -DiskLabel "data 2" `
                            -LUN 1 