New-AzureQuickVM -Windows `
                 -ServiceName $serviceName `
                 -Name $vmName `
                 -ImageName $imageName `
                 -Location $location `
                 -InstanceSize $vmSize `
                 -AdminUsername $adminUser `
                 -Password $password 