$uri = Get-AzureWinRMUri -ServiceName $serviceName -Name $vmName

$cred = Get-Credential 

Enter-PSSession -ConnectionUri $uri -Credential $cred