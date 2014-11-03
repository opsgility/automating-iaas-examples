$uri = Get-AzureWinRMUri -ServiceName $serviceName -Name $vmName

$cred = Get-Credential 

Invoke-Command -ConnectionUri $uri `
               -Credential $cred `
               -ScriptBlock { Install-WindowsFeature -Name "Web-Server" } 