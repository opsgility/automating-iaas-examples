$vmConfig | Add-AzureDataDisk -CreateNew `
                              -DiskSizeInGB 500 `
                              -DiskLabel "data 1" `
                              -LUN 0