# -HostCaching on New-AzureVMConfig refers to the OS disk setting
$vmConfig = New-AzureVMConfig -Name $vmName `
                              -InstanceSize $vmSize `
                              -ImageName $imageName `
                              -HostCaching ReadOnly 
 
$vmConfig | Add-AzureProvisioningConfig -Windows `
                            -AdminUsername $adminUser `
                            -Password $password 

$vmConfig | Add-AzureDataDisk -CreateNew `
                            -DiskSizeInGB 50 `
                            -DiskLabel "data 1" `
                            -LUN 0 `
                            -HostCaching ReadWrite

$vmConfig | Add-AzureDataDisk -CreateNew `
                            -DiskSizeInGB 50 `
                            -DiskLabel "data 2" `
                            -HostCaching ReadWrite
                            -LUN 1 