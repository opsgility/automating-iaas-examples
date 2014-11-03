$subscription = "[subscription name]"
$linuxUser = "[username]"
$password = "[your password]"
$serviceName = "[cloud service name]"
$location = "[region name]"
$vmSize = "Small"

# Ensure you have created the certificate - example C:\Scripts\mycert.cer
# http://azure.microsoft.com/en-us/documentation/articles/linux-use-ssh-key/
$certPath = "[path to your certificate]"

Select-AzureSubscription $subscription

New-AzureService -ServiceName $serviceName -Location $location

Add-AzureCertificate -CertToDeploy $certPath -ServiceName $serviceName

$cert = Get-PfxCertificate -FilePath $certPath

# Create a certificate in the user's home directory
$sshkey = New-AzureSSHKey -PublicKey -Fingerprint $cert.Thumbprint `
                          -Path "/home/$linuxUser/.ssh/authorized_keys"


$vmName = "linuxVMSSH"

$imageFamily = "Ubuntu Server 14.10 DAILY"

$imageName = Get-AzureVMImage |
                 where { $_.ImageFamily -eq $imageFamily } |
                 sort PublishedDate -Descending |
                 select -ExpandProperty ImageName -First 1


New-AzureVMConfig -Name $vmName -InstanceSize $vmSize -ImageName $imageName |
    Add-AzureProvisioningConfig -Linux -LinuxUser $linuxUser `
                                -Password $password -SSHPublicKeys $sshkey  |
    New-AzureVM -ServiceName $serviceName