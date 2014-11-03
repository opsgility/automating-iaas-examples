$subscription = "[subscription name]"
$serviceName = "[cloud service name]"
$storageAccount = "[storage account name]"
$location = "[region name]"

Select-AzureSubscription $subscription

# Script file URI
$uri  = "http://$storageAccount.blob.core.windows.net/bootstrap/ch7formatdisks.ps1"
$scriptname = "ch7formatdisks.ps1"

# The number of labels should match the number of data disks you are attaching
$diskLabels = "Label1;Label2"

$size = "Small"
$imageFamily = "Windows Server 2012 R2 Datacenter"
$vmName = "bootstrappedvm"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1

$cfg = New-AzureVMConfig -Name $vmName -InstanceSize $size -ImageName $imageName 

$cfg | Add-AzureProvisioningConfig -Windows `
                            -AdminUsername $adminUser `
                            -Password $password 

$cfg | Add-AzureDataDisk -CreateNew -DiskSizeInGB 100 -DiskLabel "Label1" -LUN 0 

$cfg | Add-AzureDataDisk -CreateNew -DiskSizeInGB 100 -DiskLabel "Label2" -LUN 1 

$cfg | Set-AzureVMCustomScriptExtension -FileUri $uri `
                                        -Run $scriptname `
                                        -Argument $diskLabels 

$cfg | New-AzureVM -ServiceName $serviceName -Location $location