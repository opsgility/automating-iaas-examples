Set-AzureAclConfig –AddRule –ACL $acl –Order 100 –Action Permit `
–RemoteSubnet "175.1.0.0/24" –Description "Allow Management Network"

Set-AzureAclConfig –AddRule –ACL $acl –Order 200 –Action Permit `
–RemoteSubnet "137.135.67.39/32" –Description "Allow Management Server 1"