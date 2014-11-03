while($true)
{
    Write-Output "Checking Gateway Status" 
    $gatewayStatus = Get-AzureVNetGateway $vnetName 
    if($gatewayStatus.State -eq "Provisioning")
    {
        Write-Output "Gateway is still provisioning.. " 
        Start-Sleep 30
    }
    elseif($gatewayStatus.State -eq "Provisioned")
    {
        Write-Output "Gateway is provisioned.. " 
        break
    }
    else
    {
        Write-Error "Gateway is in an unknown state. Cannot Continue."
        Write-Error "GW State:" $gatewayStatus.State
        return
    }
}