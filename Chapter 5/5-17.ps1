$subscription = "[subscription name]"
Select-AzureSubscription $subscription

$imageName = "WEBSERVERIMAGE"

Update-AzureVMImage -ImageName $imageName `
                    -Description "A Pre-Built web server" `
                    -ImageFamily "My Company Custom Images - IIS" `
                    -Label "Image with IIS Pre-Installed"