$subscription = "[subscription name]"
Select-AzureSubscription $subscription

# Specify the admin credentials
$adminUser = "[admin username]"
$password = "[admin password]"

$location = "[region name]"
$serviceName = "[cloud service name]"

$vmName = "ps-vmImage"
$vmSize = "Small"
$imageFamily = "Windows Server 2012 R2 Datacenter"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1

New-AzureQuickVM -Windows `
                 -ServiceName $serviceName `
                 -Name $vmName `
                 -ImageName $imageName `
                 -Location $location `
                 -AdminUsername $adminUser `
                 -Password $password  `
                 -InstanceSize $vmSize `
                 -WaitForBoot