$serviceName = "[cloud service name]"
$vmName = "[virtual machine name]"
$imageName = "[image name]"
$imageLabel = "[image label]"

Save-AzureVMImage -ServiceName $serviceName `
                  -Name $vmName `
                  -NewImageName $imageName `
                  -NewImageLabel $imageLabel `
                  -OSState Specialized