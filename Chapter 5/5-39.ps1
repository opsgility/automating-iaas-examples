$storageAccount = "[storage account name]"

$storageKey = (Get-AzureStorageKey -StorageAccountName $storageAccount).Primary

$context = New-AzureStorageContext -StorageAccountName $storageAccount `
                               -StorageAccountKey $storageKey

# Create a new storage container with Blob public access
New-AzureStorageContainer -Name "newcontainer" -Permission Blob -Context $context

# Modify the container to have the Container public access instead
Set-AzureStorageContainerAcl -Name "newcontainer" `
                             -Permission Container `
                             -Context $context