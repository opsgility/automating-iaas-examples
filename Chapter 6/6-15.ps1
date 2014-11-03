# Replace with your own subscription name
Select-AzureSubscription "[subscription name]"

# Specify the admin credentials
$adminUser = "[admin username]"
$password = "[admin password]"


# Replace with your cloud service name
$serviceName = "[cloud service name]"

$VNET = "PSBookVNET"
$Location = "West US"
$Subnet = "AppSubnet"

$vmSize = "Small"
$imageFamily = "Windows Server 2012 R2 Datacenter"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1


$vmConfigs = @()

for($i=1; $i -le 4; $i++)
{
    # Change the VM name to match the instance number
    $vmName = "vnetjoinedvm$i"

    $vmConfig = New-AzureVMConfig -Name $vmName `
                                  -InstanceSize $vmSize `
                                  -ImageName $imageName

    $vmConfig | Add-AzureProvisioningConfig -Windows `
                                            -AdminUsername $adminUser  `
                                            -Password $password

    $vmConfig | Set-AzureSubnet -SubnetNames $Subnet

    $vmConfigs += $vmConfig
}

# Create the virtual machines by passing an array of configurations
# New-AzureVM will create them on your behalf in the same cloud service
New-AzureVM -ServiceName $serviceName `
            -Location $Location `
            -VNetName $VNET `
            -VMs $vmConfigs