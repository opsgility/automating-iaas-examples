# Domain join information
$domain = "contoso"
$domFQDN = "contoso.com"
$domUser = "[domain admin user]"
$domPass = "[domain password]"
# Adding the virtual machine to an organizational unit is optional
# The OU must already exist
$domOU = 'OU=AzureVMs,DC=contoso,DC=com'
# End domain join information

$serviceName = "[cloud service name]"
$vmName = "[vm name]"
$VNET = "[virtual network name]"
$Subnet = "[subnet name]"
$Location = "[region name]"

$imageFamily = "Windows Server 2012 R2 Datacenter"
$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1

$vmConfig = New-AzureVMConfig -Name $vmName -InstanceSize Small `
                              -ImageName $imageName

$vmConfig | Add-AzureProvisioningConfig -WindowsDomain `
                                        -AdminUsername $adminUser `
                                        -Password $password `
                                        -Domain $domain `
                                        -JoinDomain $domFQDN `
                                        -DomainUserName $domUser `
                                        -DomainPassword $domPass `
                                        -MachineObjectOU $domOU

$vmConfig | Set-AzureSubnet -SubnetNames $Subnet

$vmConfig | New-AzureVM -ServiceName $serviceName `
                        -Location $location -VNetName $VNET