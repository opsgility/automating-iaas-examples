$subscription = "[subscription name]"
$linuxUser = "[username]"
$password = "[your password]"
$serviceName = "[cloud service name]"
$location = "[region name]"
$vmSize = "Small"

Select-AzureSubscription $subscription

$vmName = "linuxVM1"

$imageFamily = "Ubuntu Server 14.10 DAILY"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1


New-AzureVMConfig -Name $vmName -InstanceSize $vmSize -ImageName $imageName |
    Add-AzureProvisioningConfig -Linux -LinuxUser $linuxUser -Password $password |
    New-azureVM -ServiceName $serviceName -Location $location