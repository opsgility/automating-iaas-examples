# Service key from your previously created and provisioned circuit
$ServiceKey = "[your service key goes here]"

# MD5 hash to authenticate BGP sessions
$MD5Hash = "[your MD5 hash password]"

# Subnets used for configuring private peering
$private_Subnet_Primary   = "172.16.1.0/30"
$private_Subnet_Secondary = "172.16.2.0/30"

# Subnets used for configuring public peering
$public_Subnet_Primary    = "172.16.1.4/30"
$public_Subnet_Secondary  = "172.16.2.4/30"

# Autonomous System Number
$ASN = "65520"

# VLAN ID for private peering
$VLANPrivate = "555"

# VLAN ID for public peering
$VLANPublic = "556"

# Create the private peering configuration
New-AzureBGPPeering -ServiceKey $ServiceKey `
                    -PrimaryPeerSubnet $private_Subnet_Primary `
                    -SecondaryPeerSubnet $private_Subnet_Secondary `
                    -PeerAsn $ASN `
                    -VlanId $VLANPrivate `
                    –AccessType Private `
                    -SharedKey $MD5Hash


# Create the public peering configuration
New-AzureBGPPeering -ServiceKey $ServiceKey `
                    -PrimaryPeerSubnet $public_Subnet_Primary  `
                    -SecondaryPeerSubnet $public_Subnet_Secondary `
                    -PeerAsn $ASN `
                    -VlanId $VLANPublic `
                    -AccessType Public  `
                    -SharedKey $MD5Hash