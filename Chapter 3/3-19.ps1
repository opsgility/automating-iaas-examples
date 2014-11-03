$vmConfig | Add-AzureProvisioningConfig -Windows `
                                        -AdminUsername $adminUser `
                                        -Password $password  
                                        