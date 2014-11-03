
# Show private peering configuration 
Get-AzureBGPPeering -ServiceKey $serviceKey

# Shows public peering configuration 
Get-AzureBGPPeering -ServiceKey $serviceKey -AccessType Public