# Specify the admin credentials
$adminUser = "[admin username]"
$password = "[admin password]"
$serviceName = "[cloud service name]"

$VNET = "PSBookVNET"
$Location = "West US"
$Subnet = "AppSubnet"

$vmName = "vnetjoinedvm2"
$vmSize = "Small"

$imageFamily = "Windows Server 2012 R2 Datacenter"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1

$vmConfig = New-AzureVMConfig -Name $vmName `
                              -InstanceSize $vmSize `
                              -ImageName $imageName

$vmConfig | Add-AzureProvisioningConfig -Windows -AdminUsername $adminUser `
                                        -Password $password

$vmConfig | Set-AzureSubnet -SubnetNames $Subnet

$vmConfig | New-AzureVM -ServiceName $serviceName -Location $location -VNetName $VNET