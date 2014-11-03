Set-AzureLoadBalancedEndpoint -ServiceName $serviceName `
                              -ProbeProtocolHTTP `
                              -LBSetName "LBHTTP" `
                              -ProbePath "/healthcheck.aspx"