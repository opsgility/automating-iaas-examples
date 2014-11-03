# Assumes the .pfx file is in the same path as the script
$pfxName = Join-Path $PSScriptRoot "MyServerCertificate.pfx"

$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2

$cert.Import($pfxName,$pwd,'Exportable')

$vmConfig | Add-AzureProvisioningConfig -Windows -AdminUserName $user `
                                -Password $adminPwd -X509Certificates $cert