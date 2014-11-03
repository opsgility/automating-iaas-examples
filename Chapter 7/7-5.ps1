Select-AzureSubscription "[subscription name]"
$adminUser = "[admin username]"
$password = "[admin password]"
$serviceName = "[cloud service name]"
$location = "[region name]"

# The name of the availability set
$avset = "webavset"
$vmSize = "Small"
$imageFamily = "Windows Server 2012 R2 Datacenter"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1


$vmConfigs = @()

for($i=1; $i -le 2; $i++)
{
    # Change the VM name to match the instance number
    $vmName = "webserver$i"

    $vmConfig = New-AzureVMConfig -Name $vmName `
                                  -InstanceSize $vmSize `
                                  -ImageName $imageName `
                                  -AvailabilitySetName $avset

    $vmConfig | Add-AzureProvisioningConfig -Windows `
                                            -AdminUsername $adminUser  `
                                            -Password $password

    $vmConfig | Add-AzureEndpoint -Name "http" `
                                  -Protocol tcp `
                                  -LocalPort 80 `
                                  -PublicPort 80 `
                                  -LBSetName "LBHTTP" `
                                  -DefaultProbe

    $vmConfigs += $vmConfig
}

New-AzureVM -ServiceName $serviceName `
            -Location $Location `
            -VMs $vmConfigs