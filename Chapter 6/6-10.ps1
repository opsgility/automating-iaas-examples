[CmdletBinding()]
param(
[parameter(Mandatory)]
[string]$subscription,
[parameter(Mandatory)]
[string]$newVNetConfigPath
)

Select-AzureSubscription $subscription

[xml] $nxml =  Get-Content $newVNetConfigPath

[Xml.XmlElement]$nVNet = $nxml.NetworkConfiguration.VirtualNetworkConfiguration


# New VNET name
$nvname = $nVNet.VirtualNetworkSites.VirtualNetworkSite.name

# Retrieve the current subscription network configuration
$exml = [xml] (Get-AzureVNetConfig).XMLConfiguration


if($econfig -eq $null)
{
    Write-Output "Existing network configuration not found."
    Write-Output "Applying entire configuration." 
    Set-AzureVNetConfig -ConfigurationPath $newVNetConfigPath
    return
}

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

$newSite = $nVNet.VirtualNetworkSites.VirtualNetworkSite

$importedVnet = $exml.ImportNode($newSite, $true)

$eVNet.VirtualNetworkSites.AppendChild($importedVnet)

$tmpFile = Join-Path $env:TEMP "NewNetConfig.xml" 

$exml.Save($tmpFile)

Write-Output "Importing new virtual network to existing network configuration" 
Set-AzureVNetConfig -ConfigurationPath $tmpFile

# Delete the temporary file 
Remove-Item $tmpFile