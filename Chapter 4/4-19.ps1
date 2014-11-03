$remoteip = "137.117.17.7/32"

# Create the ACL configuration object
$acl = New-AzureAclConfig 

# Add IP address with permit 
Set-AzureAclConfig -ACL $acl `
                   -AddRule Permit `
                   -RemoteSubnet $remoteip `
                   -Order 100 `
                   -Description "Allow Access"

$vmConfig | Add-AzureEndpoint -Name "SQLSERVER" `
                              -Protocol tcp `
                              -LocalPort 1433 `
                              -PublicPort 1433 `
                              -ACL $acl
                              
                              
### Create virtual machine code here ### 