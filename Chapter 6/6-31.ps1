$ilb = New-AzureInternalLoadBalancerConfig -InternalLoadBalancerName "MyILB" `
                                    -StaticVNetIPAddress "10.20.1.100" `
                                    -SubnetName "AppSubnet" 