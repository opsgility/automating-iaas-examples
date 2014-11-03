# Existing virtual networks

[Xml.XmlElement]$eVNet = $exml.NetworkConfiguration.VirtualNetworkConfiguration

$esite = $eVNet.VirtualNetworkSites.VirtualNetworkSite

if($esite -ne $null)
{
    foreach($vnet in $esite)
    {
        if($vnet.Name -eq $nvname)
        {
            Write-Output "$nvname already exists - exiting." 
            return  
        }
    }
}