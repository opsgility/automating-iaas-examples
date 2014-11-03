$vmConfig | Add-AzureEndpoint -Name "HTTP" `
                              -Protocol tcp `
                              -LocalPort 80 `
                              -PublicPort 80 `
                              -LBSetName "LBHTTP" `
                              -DefaultProbe