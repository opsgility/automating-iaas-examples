$subscription = "[subscription name]"

$storageAccount = "[storage account name]"

Select-AzureSubscription $subscription

$destination = "C:\VHDFiles\mydatadisk_downloaded.vhd"

$source = "https://$storageAccount.blob.core.windows.net/upload/mydatadisk.vhd"

Save-AzureVhd -Source $source -LocalFilePath $destination