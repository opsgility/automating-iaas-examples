$storageAccount = "[storage account name]"
$source = "https://$storageAccount.blob.core.windows.net/upload/myWindowsImage.vhd"
$imageName = "MyWinImage"

Add-AzureVMImage -ImageName $imageName -MediaLocation $source -OS Windows