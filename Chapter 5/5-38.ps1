$sascontext = New-AzureStorageContext -StorageAccountName $storageAccount `
                                      -SasToken $sas 
                                      
                                  
Get-AzureStorageBlob -Context $sascontext -Container $container