#This is first lab for variables
Get-Process
$processes = Get-Process
#Find processes keeping the CPU busy
write-host "Processes using more than 100 CPU time:"
$processes | where-object{ $_.CPU -gt 100 } 
Write-Host "Processes using more than 100 MB of memory:"
#Sort processing by memory usage
$processes | sort-object WorkingSet -Descending
#Counting number of files larger than 100MB in the given path
$path = Read-Host "Enter the path to check for large files"
$rawFileData = Get-ChildItem -Path $path -Recurse
$largeFiles = $rawFileData | where-object { $_.Length -gt 100MB }
$largeFilesCount = $largeFiles | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "Number of files larger than 100MB in $path : $largeFilesCount"