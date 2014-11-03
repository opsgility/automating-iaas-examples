$siteName = "ONPREMVPN"

Set-AzureVNetGateway -Disconnect -VNetName $vnetName -LocalNetworkSiteName $siteName 