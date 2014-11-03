Get-AzureStorageContainer -Name "videoexample" | Get-AzureStorageBlob | foreach {
   $localPath = Join-Path "C:\Temp" $_.Name
   $_ | Get-AzureStorageBlobContent -Destination $localPath
 
}