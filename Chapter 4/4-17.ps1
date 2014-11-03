# Update the endpoint configuration by passing in the ACL 
$vmConfig | Set-AzureEndpoint -Name "RemoteDesktop" -ACL $acl

# Update the VM 
$vmConfig | Update-AzureVM