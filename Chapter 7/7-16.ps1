$fileName = "ch7formatdisks.ps1"
$fileLocation = "[full directory path to file (c:\Scripts)]"
$storageAccountName = "[storage account name]"

$filePath = Join-Path $fileLocation $fileName

$Container = "bootstrap"

$storageAccountKey = (Get-AzureStorageKey $storageAccountName).Primary

$context = New-AzureStorageContext -StorageAccountName $StorageAccountName `
                                   -StorageAccountKey $storageAccountKey

New-AzureStorageContainer $Container -Permission Container -Context $context

Set-AzureStorageBlobContent -Blob $fileName -Container $Container `
                            -File $filePath -Context $context