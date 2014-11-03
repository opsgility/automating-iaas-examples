Select-AzureSubscription $subscription

[xml] $nxml =  Get-Content $newVNetConfigPath

[Xml.XmlElement]$nVNet = $nxml.NetworkConfiguration.VirtualNetworkConfiguration

# New VNET name
$nvname = $nVNet.VirtualNetworkSites.VirtualNetworkSite.name