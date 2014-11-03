$newSite = $nVNet.VirtualNetworkSites.VirtualNetworkSite

$importedVnet = $exml.ImportNode($newSite, $true)

$eVNet.VirtualNetworkSites.AppendChild($importedVnet)

$tmpFile = Join-Path $env:TEMP "NewNetConfig.xml" 

$exml.Save($tmpFile)

Write-Output "Importing new virtual network to existing network configuration" 
Set-AzureVNetConfig -ConfigurationPath $tmpFile

# Delete the temporary file 
Remove-Item $tmpFile