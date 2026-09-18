# Exercise PowerShell Variables and Arrays
## Prerequisites and Guidelines
- Cmdlets must run on VM Windows Server (preferably with Remoting Session)
- Run the commandlets, analyze the output and write briefly your observation.
- Use PowerShell 7.6 Core otherwise mentioned explicitly
- Prompt should be '<firstname>-PS>'
```ps
function prompt {'firstname-PS'}
```
## PART A : Variables
Create a variable named process and store the running processes in it.
```ps
Get-process
$processes = Get-Process
$processes
 ```
Let's execute the following Cmdlets to find processes keeping the cpu busy. 
```ps
Get-Process | Where-Object{$_.CPU -gt 2000}
```
Now, if we use variable 
```ps
$processes | Where-Object($_.CPU -gt 2000)
```
Run the following cmdlet to sort processes in descending order by memory usage with and without variable declaration.
```ps
Get-Process | Sort-Object WorkingSet64 -descending
```
and
```ps
$processes | Sort-Object WorkingSet64 -descending
```
Next, Let's explore data types. Data Types can be classified as not strong typed and strong typed. The not strong typed means the variable is not having any predefined data type.It consider the data type based on the value assigned to it.

`$myNewVariable`

```ps
$total = 2+2
$total
```
To check the methods for the variable use `Get-Member`
```ps
$total | Get-Member
```
If we put 2+2 in single quotes, it is considered as `string` data type
```ps
$total = '2+2'
$total 
$total | Get-member
```
Try some other code snipplets, Analyze the output and briefly explain your observation
```ps
$num1 = 2
$num2 = 2
$total = $num1 +$num2
$total
```
```ps
$num1 = '2'
$num2 = '2'
$total = $num1 +$num2
$total
```
Next, try some examples for strong type.
```ps
[int]$num1 = '2.6'
[int]$num2 = '1.7'
$total = $num1 + $num 2
```
As you see in the example the variable $total is of integer data type. You can convert the data type of variable from integer to string.
```ps
$stringReturn = $total.ToString()
$total | Get-Member
```

Single Quotes and Double Quotes have different meaning in PowerShell. Single Quotes consider the text as a string whereas double quotes evaluate the expression first and then display. Try the following example.
```ps
$literal =  ' Two plus one equals: $(1+2)'
$literal
$escaped = "Two plus one equals: $(1+2)"
Write-Host '$escaped' #using single quotes
Write-Host "$escaped" #using double quotes
```
Constant Variable are reserved. Use the cmdlet `Get-Variable` to see the list of all variables.
There are certain environment variables that can be seen using the cmdlet `Get-ChildItem env:`
```ps
$env:COMPUTERNAME
$env:USERNAME
```

**Use-Case: Identifying Large Files Before a Server Storage Upgrade**

Consider a scenario where users have reported that the server is running out of disk space.Before requesting additional storage hardware, you want to determine whether a small number of unusually large files are consuming most of the available space.
 
Write a script that prompt the administrator to enter the location of shared folder or drive. It recursilvely scans all subfolders, files and filters for files larger than 100MB. It counts how many large files exist and display a summary showing the number of large files found.

```ps
$path = Read-Host -Prompt 'Please enter the file path you wish to scan for large files...'
$rawFileData = Get-ChildItem -Path $path -Recurse
$largeFiles = $rawFileData | Where-Object {$_.Length -gt 100MB}
$largeFilesCount = $largeFiles | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "You have $largeFilesCount large file(s) in $path"
```
## PART B Arrays

Arrays are a fundamental feature of PowerShell. Arrays make it possible to ingest, manipulate and output true data structures. When working with an array, you can either use the same command to perform the same function on each item within an array or access and manipulate individual item using an index.

Let's create our first array that represents bowl of fruit.
```ps
$fruit = @('Apples','Oranges','Bananas')
```
You can read the array using 
```ps
$fruit
```
which will return
`Apples`
`Oranges`
`Bananas`
Powershell will automatically index them in the way "Apple" will be indexed as 0, "Oranges" as 1, and "Bananas" as 1.

Create an empty array now.
```ps
$data = @()
```
To check how many items are in the array, use `count` function
```ps
$data.count
```
Now add data to the array
```ps
$data = @('zero', 'one' , 'two' , 'three')
$data
```