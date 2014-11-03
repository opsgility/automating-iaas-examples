# Select the subscription
Select-AzureSubscription "[subscription name]"

$vhdName = "[filename.vhd]"
$srcContainer = "[source container]"
$destContainer = "[destination container]"

# Source storage account
$srcStorage = "[source storage]"

# Destination storage account
$destStorage = "[dest storage]"

$srcStorageKey = (Get-AzureStorageKey -StorageAccountName $srcStorage).Primary

# If the destination storage account is in a separate subscription, switch to the
# destination subscription first to retrieve the storage account key.
# Select-AzureSubscription "[destination subscription name]"

$destStorageKey = (Get-AzureStorageKey -StorageAccountName $destStorage).Primary

# If the destinaton is in a separate subscription,
# switch back to the source subscription here
# Select-AzureSubscription "[subscription name]"


# Create the source storage account context
$srcContext = New-AzureStorageContext   –StorageAccountName $srcStorage `
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