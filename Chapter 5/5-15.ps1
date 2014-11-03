$imageName = "WEBSERVERIMAGE"
$imageLabel = "Image with IIS Pre-Installed" 

Save-AzureVMImage -ServiceName $serviceName `
                  -Name $vmName `
                  -NewImageName $imageName `
                  -NewImageLabel $imageLabel `
                  -OSState Generalized