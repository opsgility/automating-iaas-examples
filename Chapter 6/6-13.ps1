# Specify the admin credentials
$adminUser = "[admin username]"
$password = "[admin password]"

$serviceName = "[cloud service name]"
$VNET = "PSBookVNET"
$Location = "West US"
$Subnet = "AppSubnet"

$vmName = "vnetjoinedvm1"
$vmSize = "Small"

$imageFamily = "Windows Server 2012 R2 Datacenter"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1

New-AzureQuickVM -Windows `
                 -ServiceName $serviceName `
                 -Name $vmName `
                 -InstanceSize $vmSize `
                 -ImageName $imageName `
                 -Location $location `
                 -AdminUsername $adminUser `
                 -Password $password `
                 -VNetName $VNET `
                 -SubnetNames $Subnet