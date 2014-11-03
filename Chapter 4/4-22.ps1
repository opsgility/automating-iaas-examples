$serviceName = "[cloud service name]"

# Specify the admin credentials
$adminUser = "[admin username]"
$password = "[admin password]"

# Specify the region to create the virtual machine in
# Must match the region of the reserved IP
$location = "[region name]"

# Specify your reserved IP name here
$reservedIP = "[the name of your reserved IP]"

# Specify the virtual machine name
$vmName = "ps-reservedip1"

$vmSize = "Small"

$imageFamily = "Windows Server 2012 R2 Datacenter"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1

# Create a virtual machine configuration object
$vm1 = New-AzureVMConfig -Name $vmName -InstanceSize $vmSize -ImageName $imageName |
        Add-AzureProvisioningConfig -Windows `
                                    -AdminUsername $adminUser `
                                    -Password $password

# Specify the reserved IP address for the external VIP
New-AzureVM -ServiceName $serviceName -Location $location `
            -VMs $vm1 `
            -ReservedIPName $reservedIP