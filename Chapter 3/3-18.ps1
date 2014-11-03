$vmName = "ps-vm2" 

$vmConfig = New-AzureVMConfig -Name $vmName `
                              -InstanceSize $vmSize `
                              -ImageName $imageName