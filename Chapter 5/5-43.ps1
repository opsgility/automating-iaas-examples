$localPath = "C:\AdventureWorksDB"
$container = "adventureworks"

$existingContainer = Get-AzureStorageContainer -Name $container `
                                               -ErrorAction SilentlyContinue

If($existingContainer -eq $null)
{
    New-AzureStorageContainer -Name $container
}

Get-ChildItem $localPath | foreach {
    Set-AzureStorageBlobContent -File $_.FullName -Container $container
}