Select-AzureSubscription "[subscription name]"

$serviceName = "[cloud service name]"

Get-AzureVM -ServiceName $serviceName |
    Set-AzureAvailabilitySet -AvailabilitySetName "webavset" |
    Update-AzureVM