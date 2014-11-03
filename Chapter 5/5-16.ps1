$subscription = "[subscription name]"
$location = "[region name]"
$serviceName = "[cloud service name]"

# Specify the admin credentials
$adminUser = "[admin username]"
$password = "[admin password]"

Select-AzureSubscription $subscription
$vmSize = "Small"
$vmName = "ps-webserver1"

$imageName = "WEBSERVERIMAGE"

New-AzureQuickVM -Windows `
                 -ServiceName $serviceName `
                 -Name $vmName `
                 -ImageName $imageName `
                 -Location $location `
                 -AdminUsername $adminUser `
                 -Password $password `
                 -InstanceSize $vmSize