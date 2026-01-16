# Introduction to PowerShell Arrays and Hashtables
#$weekdays = @('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
#$weekdays[1]
#$weekdays[2..4]
#$weekdays += @('Saturday', 'Sunday')
#$months = [System.Collections.ArrayList]@{}
#$months.Add('January')
#$months += @('February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December')       
#$months
$users = @{
   '001' = 'Alice'
   '002' = 'Bob'
   '003' = 'Charlie'
}         
 
$users['004'] = 'Diana'
$users.remove('001')
$users.Keys
 # $users

