# Select the subscription
Select-AzureSubscription "opsgilitytraining"  

# Retrieved the OS disk name using: 
# Get-AzureVM -ServiceName "psdeploysvc" -Name "psdeploy" | Get-AzureOSDisk
$vhdName = "psdeploysvc-psdeploy-2014-03-17.vhd"
$srcContainer = "vhds"
$destContainer = "copiedvhds"

# Source storage account
$srcStorage = "opsgilitywest"

# Destination storage account
$destStorage = "opsgilityeast1"

$srcStorageKey = (Get-AzureStorageKey -StorageAccountName $srcStorage).Primary


$destStorageKey = (Get-AzureStorageKey -StorageAccountName $destStorage).Primary

# Create the source storage account context 
$srcContext = New-AzureStorageContext  –StorageAccountName $srcStorage `
                                        -StorageAccountKey $srcStorageKey  

# Create the destination storage account context 
$destContext = New-AzureStorageContext  –StorageAccountName $destStorage `
                                        -StorageAccountKey $destStorageKey  
 
# Create the container on the destination
New-AzureStorageContainer -Name $destContainer -Context $destContext 
 
# Start the asynchronous copy - specify the source authentication with -Context
$blobCopyState = Start-AzureStorageBlobCopy -srcBlob $vhdName `
                                            -srcContainer $srcContainer `
                                            -Context $srcContext `
                                            -DestContainer $destContainer `
                                            -DestBlob $vhdName `
                                            -DestContext $destContext
                                            
# Retrieve the current status of the copy operation 
$status = $blobCopyState | Get-AzureStorageBlobCopyState 
 
# Print out status
$status 
 
# Loop until complete 
While($status.Status -eq "Pending"){
  $status = $blobCopyState | Get-AzureStorageBlobCopyState 
  Start-Sleep 10
  # Print out status
  $status
}