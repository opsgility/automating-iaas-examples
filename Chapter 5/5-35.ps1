$storageAccount = "[storage account name]"

$storageKey = (Get-AzureStorageKey -StorageAccountName $storageAccount).Primary

$context = New-AzureStorageContext -StorageAccountName $storageAccount `
                                   -StorageAccountKey $storageKey