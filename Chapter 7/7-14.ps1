$serviceName  = "[cloud service name]"
$vmName = "[VM name]"
$newAdminUser = "[new user]"
$newPassword = "[new password]"

$vmConfig = Get-AzureVM -ServiceName $serviceName -Name $vmName

$vmConfig | Set-AzureVMAccessExtension -UserName $newAdminUser -Password $newPassword

$vmConfig | Update-AzureVM