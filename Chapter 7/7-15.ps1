param(
    $labels
)

# Split the passed-in labels using ; as the delimeter
$labelsArr = $labels.Split(";")

# Format disks 
$disks = Get-Disk | where partitionstyle -eq 'raw' | sort number

# Start at F cast to a char
$letters = 70..89 | foreach { ([char] $_ ) }  



$count = 0
foreach ($d in $disks) {
  $driveLetter = $letters[$count].ToString()

  $d | 
  Initialize-Disk -PartitionStyle MBR -PassThru | 
  New-Partition -UseMaximumSize -DriveLetter $driveLetter |
  Format-Volume -FileSystem NTFS -NewFileSystemLabel $labelsArr[$count] `
                -Confirm:$false -Force
  $count++
}