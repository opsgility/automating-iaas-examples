Get-AzureVMImage |
	where { $_.IsPremium -eq $true -and $_.RecommendedVMSize -eq "A6" }