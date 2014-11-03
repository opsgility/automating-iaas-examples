Set-AzureAclConfig –AddRule –ACL $acl –Order 100 –Action Permit `
–RemoteSubnet "175.1.0.0/24" –Description "Allow Management Network"