$subscription = "[subscription name]"
Select-AzureSubscription $subscription

$location = "[region name]"
$serviceName = "[cloud service name]"

# Specify the admin credentials
$adminUser = "[admin username]"
$password = "[admin password]"

$storageAccount = (Get-AzureSubscription -Current).CurrentStorageAccountName

$vmName = "ps-vmDisks"
$vmSize = "Small"

$imageFamily = "Windows Server 2012 R2 Datacenter"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1

# Custom location and filenames
$oslocation = "https://$storageAccount.blob.core.windows.net/custom/osdisk.vhd"
$d1Location = "https://$storageAccount.blob.core.windows.net/custom/data1.vhd"
$d2Location = "https://$storageAccount.blob.core.windows.net/custom/data2.vhd"


$vmConfig = New-AzureVMConfig -Name $vmName `
                              -InstanceSize $vmSize `
                              -ImageName $imageName `
                              -MediaLocation $oslocation

$vmConfig | Add-AzureProvisioningConfig -Windows `
                              -AdminUsername $adminUser `
                              -Password $password

$vmConfig | Add-AzureDataDisk -CreateNew `
                              -DiskSizeInGB 50 `
                              -DiskLabel "data 1" `
                              -LUN 0 `
                              -MediaLocation $d1Location


$vmConfig | Add-AzureDataDisk -CreateNew `
                              -DiskSizeInGB 50 `
                              -DiskLabel "data 2" `
                              -LUN 1 `
                              -MediaLocation $d2Location

$vmConfig | New-AzureVM -ServiceName $serviceName -Location $location