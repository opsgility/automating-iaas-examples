Get-AzureDisk | where { $_.AttachedTo -eq $null -and $_.OS -eq "Windows" } 

Get-AzureDisk | where { $_.AttachedTo -eq $null -and $_.OS -eq "Linux" } 