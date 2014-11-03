# Create the ACL configuration object
$acl = New-AzureAclConfig 

# Add my IP address with permit 
Set-AzureAclConfig -ACL $acl `
                   -AddRule Permit `
                   -RemoteSubnet $myip `
                   -Order 100 `
                   -Description "Allow RDP"