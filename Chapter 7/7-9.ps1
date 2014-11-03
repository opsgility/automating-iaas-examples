$subscription = "[subscription name]"
$serviceName  = "[cloud service name]"
$vmName = "ps-vm1"

.\InstallWinRMCertAzureVM.ps1 -SubscriptionName $subscription `
                -ServiceName $serviceName -Name $vmName