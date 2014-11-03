$sas = New-AzureStorageContainerSASToken -Name $container `
                                         -Permission rwdl `
                                         -Context $context