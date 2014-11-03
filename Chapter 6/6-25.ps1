$vnetName = "PSBookVNETS2S"
$vendor = "Microsoft Corporation"
$platform = "RRAS"
$osfamily = "Windows Server 2012"

# Calls and downloads the script
$sURI = "https://management.core.windows.net/$subscriptionID/services/networking/"
$sURI += "$vnetName/gateway/vpndeviceconfigscript?vendor=$vendor&platform=$platform"
$sURI += "&osfamily=$osfamily"

$task = $httpClient.GetStringAsync($sURI)
$task.Wait()

if ($task.IsCompleted) 
{
   $vpnScript = $task.Result | Out-String 
   $vpnScript | Out-File "$PSScriptRoot\VPNDevice.ps1"
} 
else 
{
   Write-Error "An Error Occurred Downloading VPN Script" + $task.Exception.Message
}