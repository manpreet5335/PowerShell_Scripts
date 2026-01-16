1 -eq 1
[int32]$x = read-host "Enter any number between 1 to 50: "
if ($x -gt 10) {Write-Host "This is if statement"
$x--}
else {Write-Host "This is else statement"
$x--}
Write-host "this is a test"
