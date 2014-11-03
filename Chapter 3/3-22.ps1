$vmConfig | Add-AzureEndpoint -Name "HTTPS" `
                              -Protocol tcp `
                              -LocalPort 443 `
                              -PublicPort 443 `
                              -LBSetName "LBHTTPS" `
                              -DefaultProbe