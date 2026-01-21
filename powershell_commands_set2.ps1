#Powershell variable assignment examples
$welcome_str = "Hello, Friends!"                 #string variable
$number = 42                                #integer variable
$isActive = $true                           #boolean variable
$items = @("apple", "banana", "cherry")     #array variable
$person = @{                                #hashtable variable
    Name = "John Doe"
    Age = 30
    Occupation = "Developer"
}


# Output the variables to verify their values
Write-Host $welcome_str
Write-Host $number
Write-Host $isActive
Write-Host $items
Write-Host $person.Name
Write-Host $person.Age
Write-Host $person.Occupation


# Perform some operations
# String concatenation
$final_str = $welcome_str + " Welcome to PowerShell scripting."
Write-Host $final_str

# Find string length
$stringLength = $final_str.Length
Write-Host "Greeting Length: $stringLength"

# Use substring
$subStr1 = $final_str.Substring(0, 7)
Write-Host "Substring: $subStr1"
$subStr2 = $final_str.Substring(15, $stringLength - 15)
Write-Host "Substring: $subStr2"

#Use ToUpper() and ToLower()
$upperStr = $final_str.ToUpper()
Write-Host "Uppercase: $upperStr"
$lowerStr = $final_str.ToLower()
Write-Host "Lowercase: $lowerStr"

#Use Trim()
$trimmedStr = "   PowerShell.   ".Trim()
Write-Host "Trimmed String: '$trimmedStr'"
$TrimmedStr1 = "   Leading spaces    ".TrimStart()
Write-Host "Trimmed Start: '$TrimmedStr1'"
$TrimmedStr2 = "    Trailing spaces   ".TrimEnd()
Write-Host "Trimmed End: '$TrimmedStr2'"
$TrimmedStr3 = "__Underscores_".Trim('_')
Write-Host "Trimmed Underscores: '$TrimmedStr3'"
$TrimmedStr4 = "--Dashes--".Trim('-')
Write-Host "Trimmed Dashes: '$TrimmedStr4'"
$TrimmedStr5 = "  Mixed__--  ".Trim(' ', '_', '-')
Write-Host "Trimmed Mixed: '$TrimmedStr5'"

#Use split()
$splitItems = "apple,banana,orange" -split ","
Write-Host "Split Items: $splitItems"

#Use join()
$joinedStr = "apple","banana","orange" -join "| "
Write-Host "Joined String: $joinedStr"

#Use replace()
$replacedStr = "Next session will be on Sunday".Replace("Sunday", "Monday")
Write-Host "Replaced String: $replacedStr"

#Use indexer to access array elements
$firstItem = $items[0]
Write-Host "First Item: $firstItem"

#Use Padleft() and Padright()
$paddedLeft = "42".PadLeft(5, '0')
Write-Host "Padded Left: '$paddedLeft'"
$paddedRight = "42".PadRight(5, '0')
Write-Host "Padded Right: '$paddedRight'"

#Use Indexer to access hashtable values
$personName = $person["Name"]
Write-Host "Person Name: $personName"
$personAge = $person["Age"]
Write-Host "Person Age: $personAge"
$personOccupation = $person["Occupation"]
Write-Host "Person Occupation: $personOccupation"

#Use Indexof()
$indexOfE = "Welcome".IndexOf("e")
Write-Host "Index of 'e': $indexOfE"

#Use LastIndexof()
$lastIndexOfE = "Welcome".LastIndexOf("e")
Write-Host "Last Index of 'e': $lastIndexOfE"

#Use Remove()
$Removestr = "Welcome".Remove(0,3)  # "Welome"
Write-Host "After Remove: " $Removestr
$Removestr2 = "Welcome".Remove(0,5)  # "Welome"
Write-Host "After Remove: " $Removestr2

#Use Insert()
$Insertstr1 = "Wlcome".Insert(1,'e')  # "Welcome"
Write-Host "After Insert: " $Insertstr1
$Insertstr1 = "Wel".Insert(3,'come')  # "Welcome"
Write-Host "After Insert: " $Insertstr1


# Arithmetic operations
$sum = $number + 8
Write-Host "Sum: $sum"
$product = $number * 2
Write-Host "Product: $product"
$subtraction = $number - 10
Write-Host "Subtraction: $subtraction"
$division = $number / 2
Write-Host "Division: $division"
$itemCount = $items.Count
Write-Host "Item Count: $itemCount"
$person.Age += 1
Write-Host "Updated Age: $($person.Age)"   
 

# Boolean operations
$andResult = $isActive -and $false
Write-Host "AND Result: $andResult"
$orResult = $isActive -or $false
Write-Host "OR Result: $orResult"
$notResult = -not $isActive
Write-Host "NOT Result: $notResult"

# Conditional check
if ($isActive) {
    Write-Host "The system is active."
} else {
    Write-Host "The system is inactive."
}


# Create table
$data = @(
    [pscustomobject]@{ Variable = '$welcome_str'; Type = 'String';    Value = $welcome_str }
    [pscustomobject]@{ Variable = '$number';      Type = 'Integer';   Value = $number }
    [pscustomobject]@{ Variable = '$isActive';    Type = 'Boolean';   Value = $isActive }
    [pscustomobject]@{ Variable = '$items';       Type = 'Array';     Value = ($items -join ', ') }
    [pscustomobject]@{ Variable = '$person';      Type = 'Hashtable'; Value = "Name=$($person.Name); Age=$($person.Age); Occupation=$($person.Occupation)" }
)

$data | Format-Table -AutoSize
$data | Export-Csv -Path "d:\test\variables_summary.csv" -NoTypeInformation
$data | Out-File -FilePath "d:\test\variables_summary.txt"
$data | ConvertTo-Html | Out-File -FilePath "d:\test\variables_summary.html"

