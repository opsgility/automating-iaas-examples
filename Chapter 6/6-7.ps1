# Retrieve the current subscription network configuration
$exml = [xml] (Get-AzureVNetConfig).XMLConfiguration


if($exml -eq $null)
{
    Write-Output "Existing network configuration not found."
    Write-Output "Applying entire configuration." 
    Set-AzureVNetConfig -ConfigurationPath $newVNetConfigPath
    return
}
