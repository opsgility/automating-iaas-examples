$vmConfig | Add-AzureEndpoint -Name "CUSTOMUDP" `
                              -Protocol udp `
                              -LocalPort 5001 `
                              -PublicPort 5001 `
                              -LBSetName "LBCUSTOMUDP" `
                              -ProbeProtocol tcp `
                              -ProbePort 5051