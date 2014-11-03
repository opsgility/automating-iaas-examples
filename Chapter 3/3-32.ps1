Select-AzureSubscription "[subscription name]"

$serviceName = "[cloud service name]"

$vmName = "ps-vm1"

$vmConfig = Get-AzureVM -ServiceName $serviceName -Name $vmName

$vmConfig | Add-AzureEndpoint -Name "RemoteDesktop" `
                              -LocalPort 3389 `
                              -Protocol TCP

$vmConfig | Add-AzureDataDisk -CreateNew `
                              -DiskSizeInGB 500 `
                              -DiskLabel "data 1" `
                              -LUN 0

$vmConfig | Add-AzureEndpoint -Name "HTTP" `
                              -Protocol tcp `
                              -LocalPort 80 `
                              -PublicPort 80 `
                              -LBSetName "LBHTTP" `
                              -DefaultProbe

$vmConfig | Add-AzureEndpoint -Name "HTTPS" `
                              -Protocol tcp `
                              -LocalPort 443 `
                              -PublicPort 443 `
                              -LBSetName "LBHTTPS" `
                              -DefaultProbe

$vmConfig | Update-AzureVM