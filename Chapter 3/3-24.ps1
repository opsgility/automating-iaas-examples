# Replace with your own subscription name
$subscription = "[subscription name]"

Select-AzureSubscription $subscription

# Replace with the region you wish to deploy in
$location = "[region name]"

$vmSize = "Small"

# Replace with your own storage account name
$storageAccount = "[storage account name]"

Set-AzureSubscription -SubscriptionName $subscription `
                      -CurrentStorageAccountName $storageAccount

$imageFamily = "Windows Server 2012 R2 Datacenter"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1

# Replace with a unique cloud service name
$serviceName = "[cloud service name]"

# Specify the admin credentials
$adminUser = "[admin user name]"
$password = "[admin password]"

# Specify the computer name
$vmName = "ps-vm1"


New-AzureQuickVM -Windows `
                 -ServiceName $serviceName `
                 -Name $vmName `
                 -ImageName $imageName `
                 -Location $location `
                 -InstanceSize $vmSize `
                 -AdminUsername $adminUser `
                 -Password $password


$vmName = "ps-vm2"

$vmConfig = New-AzureVMConfig -Name $vmName `
                              -InstanceSize $vmSize `
                              -ImageName $imageName

$vmConfig | Add-AzureProvisioningConfig -Windows `
                                        -AdminUsername $adminUser `
                                        -Password $password

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

New-AzureVM -ServiceName $serviceName -VMs $vmConfig