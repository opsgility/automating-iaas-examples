# Use the smallest range available (a single IP)
# Example: $myip = "12.153.189.234/32"

$myip = "[my ip address]/32"
$serviceName = "[cloud service name]"
$vmName = "ps-vm1"

# Create the ACL configuration object
$acl = New-AzureAclConfig

# Add my IP address with permit
Set-AzureAclConfig -ACL $acl `
                   -AddRule Permit `
                   -RemoteSubnet $myip `
                   -Order 100 `
                   -Description "Allow RDP"


# Return the VM configuration
$vmConfig = Get-AzureVM -ServiceName $serviceName `
                        -Name $vmName

# Update the endpoint configuration by passing in the ACL
$vmConfig | Set-AzureEndpoint -Name "RemoteDesktop" -ACL $acl

# Update the VM
$vmConfig | Update-AzureVM