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