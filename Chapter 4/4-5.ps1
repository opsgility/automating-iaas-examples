$vmConfig | Add-AzureEndpoint -Name "CUSTOMHTTP" `
                              -Protocol tcp `
                              -LocalPort 8080 `
                              -PublicPort 8080 `
                              -LBSetName "LBCUSTOMHTTP" `
                              -ProbeProtocol http `
                              -ProbePort 8080 `
                              -ProbePath '/healthcheck.aspx' `
                              -ProbeTimeIntervalInSeconds 30 `
                              -ProbeTimeoutInSeconds 62