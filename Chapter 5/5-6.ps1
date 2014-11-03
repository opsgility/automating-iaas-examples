$serviceName = "[cloud service name]"
$location = "[region name]"
$vmName = "migratedVM"
$vmSize = "Small"
$osdiskName = "os disk"
$datadiskname = "data disk"

# Create the configuration specifying the disk name instead of an image
$vmConfig = New-AzureVMConfig -Name $vmName `
                              -InstanceSize $vmSize `
                              -DiskName $osdiskName

# Import the data disk to the first LUN
$vmConfig | Add-AzureDataDisk -Import -DiskName $datadiskname -LUN 0

# Create the virtual machine
$vmConfig | New-AzureVM -ServiceName $serviceName -Location $location