# Specify a new cloud service name
$newServiceName = "[new cloud service name]"

# The region for the new virtual machine must be the same as the disk location
$location = "[region name]"

# Load the configuration
$vmConfig = Import-AzureVM -Path $localPath

# Create the virtual machine using the imported configuration
$vmConfig | New-AzureVM -ServiceName $newServiceName -Location $location