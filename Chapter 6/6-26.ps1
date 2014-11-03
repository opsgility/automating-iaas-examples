$RRASServer = "myrrassvr" 

Write-Output "Configuring RRAS for Site-to-Site tunnel on Server $RRASServer" 
Invoke-Command -ComputerName $RRASServer -FilePath "$PSScriptRoot\VPNDevice.ps1"