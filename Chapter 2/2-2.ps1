$cert = Get-Item Cert:\CurrentUser\My\[certificate thumbprint]

$subscriptionID = "[your subscription ID]"
$localName = "[manually added subscription name]"

Set-AzureSubscription -SubscriptionName $localName `
                      -SubscriptionId $subscriptionID `
                      -Certificate $cert