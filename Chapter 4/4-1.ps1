$vmConfig | Add-AzureEndpoint -Name "RemoteDesktop" `
                              -LocalPort 3389 `
                              -Protocol TCP 