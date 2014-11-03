$siteName = "ONPREMVPN"

Set-AzureVNetGateway -Connect -VNetName $vnetName -LocalNetworkSiteName $siteName 