<#
.SYNOPSIS
    Comprehensive PowerShell demonstration showcasing idiomatic features
.DESCRIPTION
    This script demonstrates modern PowerShell features including cmdlets,
    pipeline operations, objects, error handling, and advanced functions.
.NOTES
    Author: PowerShell Developer
    Version: 1.0
    Date: 2025-11-28
#>

#Requires -Version 5.1

# Set strict mode for better error catching
Set-StrictMode -Version Latest

# ============================================================================
# Global Variables and Configuration
# ============================================================================
$Script:Title = "PowerShell Feature Showcase"
$Script:Version = "1.0"

# ============================================================================
# Helper Functions
# ============================================================================

function Write-SectionHeader {
    <#
    .SYNOPSIS
        Writes a formatted section header
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Title,
        
        [Parameter()]
        [ValidateSet('Cyan', 'Green', 'Yellow', 'Magenta')]
        [string]$Color = 'Cyan'
    )
    
    Write-Host "`n$('=' * 70)" -ForegroundColor $Color
    Write-Host $Title -ForegroundColor $Color
    Write-Host $('=' * 70) -ForegroundColor $Color
}

function Write-SubHeader {
    <#
    .SYNOPSIS
        Writes a formatted sub-header
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Title
    )
    
    Write-Host "`n--- $Title ---" -ForegroundColor Yellow
}

# ============================================================================
# 1. Variables and Data Types
# ============================================================================
function Show-VariablesAndTypes {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[1] Variables and Data Types"
    
    # Strongly-typed variables
    [int]$intNumber = 42
    [long]$longNumber = 9223372036854775807
    [double]$doubleNumber = 3.14159
    [decimal]$decimalNumber = 19.99
    [string]$text = "PowerShell"
    [bool]$isTrue = $true
    [datetime]$currentDate = Get-Date
    
    Write-Host "Integer: $intNumber (Type: $($intNumber.GetType().Name))"
    Write-Host "Long: $longNumber (Type: $($longNumber.GetType().Name))"
    Write-Host "Double: $doubleNumber (Type: $($doubleNumber.GetType().Name))"
    Write-Host "Decimal: $decimalNumber (Type: $($decimalNumber.GetType().Name))"
    Write-Host "String: $text (Type: $($text.GetType().Name))"
    Write-Host "Boolean: $isTrue (Type: $($isTrue.GetType().Name))"
    Write-Host "DateTime: $($currentDate.ToString('yyyy-MM-dd HH:mm:ss'))"
    
    # Array
    $array = @(1, 2, 3, 4, 5)
    Write-Host "`nArray: $($array -join ', ')"
    Write-Host "Array length: $($array.Length)"
    
    # ArrayList (dynamic)
    $arrayList = [System.Collections.ArrayList]@(10, 20, 30)
    $arrayList.Add(40) | Out-Null
    Write-Host "ArrayList: $($arrayList -join ', ')"
    
    # Hashtable
    $hashtable = @{
        Name = "John"
        Age = 30
        City = "New York"
    }
    Write-Host "`nHashtable:"
    $hashtable.GetEnumerator() | ForEach-Object {
        Write-Host "  $($_.Key): $($_.Value)"
    }
    
    # PSCustomObject
    $person = [PSCustomObject]@{
        FirstName = "Jane"
        LastName = "Doe"
        Age = 28
    }
    Write-Host "`nPSCustomObject:"
    $person | Format-List
}

# ============================================================================
# 2. String Manipulation
# ============================================================================
function Show-StringOperations {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[2] String Manipulation"
    
    $text = "PowerShell is awesome!"
    
    Write-Host "Original: '$text'"
    Write-Host "Length: $($text.Length)"
    Write-Host "Uppercase: $($text.ToUpper())"
    Write-Host "Lowercase: $($text.ToLower())"
    Write-Host "Replace: $($text.Replace('awesome', 'amazing'))"
    Write-Host "Substring (0, 10): $($text.Substring(0, 10))"
    Write-Host "Contains 'Shell': $($text.Contains('Shell'))"
    Write-Host "StartsWith 'Power': $($text.StartsWith('Power'))"
    Write-Host "EndsWith '!': $($text.EndsWith('!'))"
    
    # String interpolation
    $name = "World"
    Write-Host "`nString interpolation: Hello, $name!"
    
    # Here-string
    $hereString = @"
This is a here-string.
It preserves line breaks
and formatting.
"@
    Write-Host "`nHere-string:"
    Write-Host $hereString
    
    # String formatting
    $formatted = "Name: {0}, Age: {1}" -f "Alice", 25
    Write-Host "`nFormatted string: $formatted"
    
    # Split and Join
    $csv = "apple,banana,cherry"
    $fruits = $csv -split ','
    Write-Host "`nSplit: $($fruits -join ' | ')"
    
    # Regular expressions
    $email = "user@example.com"
    if ($email -match '^[\w\.-]+@[\w\.-]+\.\w+$') {
        Write-Host "`n'$email' is a valid email format"
    }
}

# ============================================================================
# 3. Operators and Comparisons
# ============================================================================
function Show-Operators {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[3] Operators and Comparisons"
    
    # Arithmetic operators
    $a = 10
    $b = 3
    Write-Host "Arithmetic operators (a=$a, b=$b):"
    Write-Host "  Addition: $a + $b = $($a + $b)"
    Write-Host "  Subtraction: $a - $b = $($a - $b)"
    Write-Host "  Multiplication: $a * $b = $($a * $b)"
    Write-Host "  Division: $a / $b = $($a / $b)"
    Write-Host "  Modulo: $a % $b = $($a % $b)"
    
    # Comparison operators
    Write-Host "`nComparison operators:"
    Write-Host "  -eq (equal): $a -eq $b = $($a -eq $b)"
    Write-Host "  -ne (not equal): $a -ne $b = $($a -ne $b)"
    Write-Host "  -gt (greater than): $a -gt $b = $($a -gt $b)"
    Write-Host "  -ge (greater or equal): $a -ge $b = $($a -ge $b)"
    Write-Host "  -lt (less than): $a -lt $b = $($a -lt $b)"
    Write-Host "  -le (less or equal): $a -le $b = $($a -le $b)"
    
    # Logical operators
    Write-Host "`nLogical operators:"
    Write-Host "  -and: `$true -and `$false = $($true -and $false)"
    Write-Host "  -or: `$true -or `$false = $($true -or $false)"
    Write-Host "  -not: -not `$true = $(-not $true)"
    Write-Host "  -xor: `$true -xor `$false = $($true -xor $false)"
    
    # String operators
    Write-Host "`nString operators:"
    Write-Host "  -like: 'PowerShell' -like '*Shell' = $('PowerShell' -like '*Shell')"
    Write-Host "  -match: 'test123' -match '\d+' = $('test123' -match '\d+')"
    Write-Host "  -contains: @(1,2,3) -contains 2 = $(@(1,2,3) -contains 2)"
    Write-Host "  -in: 5 -in @(1,5,10) = $(5 -in @(1,5,10))"
}

# ============================================================================
# 4. Control Flow
# ============================================================================
function Show-ControlFlow {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[4] Control Flow"
    
    # If-ElseIf-Else
    Write-SubHeader -Title "If-ElseIf-Else"
    $score = 85
    if ($score -ge 90) {
        Write-Host "Grade: A"
    }
    elseif ($score -ge 80) {
        Write-Host "Grade: B"
    }
    elseif ($score -ge 70) {
        Write-Host "Grade: C"
    }
    else {
        Write-Host "Grade: F"
    }
    
    # Switch statement
    Write-SubHeader -Title "Switch Statement"
    $day = 3
    switch ($day) {
        1 { Write-Host "Monday" }
        2 { Write-Host "Tuesday" }
        3 { Write-Host "Wednesday" }
        4 { Write-Host "Thursday" }
        5 { Write-Host "Friday" }
        {$_ -in 6,7} { Write-Host "Weekend!" }
        default { Write-Host "Invalid day" }
    }
    
    # Ternary operator (PowerShell 7+)
    Write-SubHeader -Title "Ternary Operator (PS 7+)"
    $age = 20
    $status = $age -ge 18 ? "Adult" : "Minor"
    Write-Host "Status: $status"
}

# ============================================================================
# 5. Loops
# ============================================================================
function Show-Loops {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[5] Loops"
    
    # For loop
    Write-SubHeader -Title "For Loop"
    for ($i = 1; $i -le 5; $i++) {
        Write-Host "  Iteration: $i"
    }
    
    # ForEach loop
    Write-SubHeader -Title "ForEach Loop"
    $fruits = @("Apple", "Banana", "Cherry")
    foreach ($fruit in $fruits) {
        Write-Host "  Fruit: $fruit"
    }
    
    # While loop
    Write-SubHeader -Title "While Loop"
    $counter = 1
    while ($counter -le 3) {
        Write-Host "  Counter: $counter"
        $counter++
    }
    
    # Do-While loop
    Write-SubHeader -Title "Do-While Loop"
    $num = 1
    do {
        Write-Host "  Number: $num"
        $num++
    } while ($num -le 3)
    
    # ForEach-Object (pipeline)
    Write-SubHeader -Title "ForEach-Object (Pipeline)"
    1..3 | ForEach-Object {
        Write-Host "  Pipeline item: $_"
    }
}

# ============================================================================
# 6. Functions and Parameters
# ============================================================================
function Show-Functions {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[6] Functions and Parameters"
    
    # Simple function
    function Get-Greeting {
        param([string]$Name)
        return "Hello, $Name!"
    }
    
    Write-Host (Get-Greeting -Name "PowerShell")
    
    # Advanced function with parameter validation
    function Add-Numbers {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory = $true)]
            [ValidateRange(0, 1000)]
            [int]$First,
            
            [Parameter(Mandatory = $true)]
            [ValidateRange(0, 1000)]
            [int]$Second
        )
        
        return $First + $Second
    }
    
    $sum = Add-Numbers -First 25 -Second 17
    Write-Host "`nAdd-Numbers: 25 + 17 = $sum"
    
    # Function with multiple outputs
    function Get-Statistics {
        param([int[]]$Numbers)
        
        $stats = [PSCustomObject]@{
            Count = $Numbers.Count
            Sum = ($Numbers | Measure-Object -Sum).Sum
            Average = ($Numbers | Measure-Object -Average).Average
            Min = ($Numbers | Measure-Object -Minimum).Minimum
            Max = ($Numbers | Measure-Object -Maximum).Maximum
        }
        
        return $stats
    }
    
    $numbers = @(5, 10, 15, 20, 25)
    $stats = Get-Statistics -Numbers $numbers
    Write-Host "`nStatistics for: $($numbers -join ', ')"
    $stats | Format-List
}

# ============================================================================
# 7. Pipeline Operations
# ============================================================================
function Show-PipelineOperations {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[7] Pipeline Operations"
    
    # Where-Object (filtering)
    Write-SubHeader -Title "Where-Object (Filtering)"
    $numbers = 1..10
    $evens = $numbers | Where-Object { $_ % 2 -eq 0 }
    Write-Host "Even numbers: $($evens -join ', ')"
    
    # Select-Object (projection)
    Write-SubHeader -Title "Select-Object (Projection)"
    $processes = Get-Process | Select-Object -First 5 Name, Id, CPU
    $processes | Format-Table -AutoSize
    
    # Sort-Object
    Write-SubHeader -Title "Sort-Object"
    $items = @(
        [PSCustomObject]@{Name="Charlie"; Score=85}
        [PSCustomObject]@{Name="Alice"; Score=95}
        [PSCustomObject]@{Name="Bob"; Score=90}
    )
    Write-Host "Sorted by Score:"
    $items | Sort-Object Score -Descending | Format-Table -AutoSize
    
    # Group-Object
    Write-SubHeader -Title "Group-Object"
    $data = @(
        [PSCustomObject]@{Category="A"; Value=10}
        [PSCustomObject]@{Category="B"; Value=20}
        [PSCustomObject]@{Category="A"; Value=15}
        [PSCustomObject]@{Category="B"; Value=25}
    )
    $grouped = $data | Group-Object Category
    $grouped | ForEach-Object {
        Write-Host "Category $($_.Name): $($_.Count) items"
    }
    
    # Measure-Object
    Write-SubHeader -Title "Measure-Object"
    $numbers = 1..100
    $stats = $numbers | Measure-Object -Sum -Average -Minimum -Maximum
    Write-Host "Sum: $($stats.Sum)"
    Write-Host "Average: $($stats.Average)"
    Write-Host "Min: $($stats.Minimum), Max: $($stats.Maximum)"
}

# ============================================================================
# 8. Error Handling
# ============================================================================
function Show-ErrorHandling {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[8] Error Handling"
    
    # Try-Catch-Finally
    Write-SubHeader -Title "Try-Catch-Finally"
    try {
        Write-Host "Attempting division..."
        $result = 10 / 0
    }
    catch [System.DivideByZeroException] {
        Write-Host "Error: Cannot divide by zero!" -ForegroundColor Red
    }
    catch {
        Write-Host "General error: $($_.Exception.Message)" -ForegroundColor Red
    }
    finally {
        Write-Host "Cleanup code executed"
    }
    
    # ErrorAction parameter
    Write-SubHeader -Title "ErrorAction Parameter"
    Write-Host "With -ErrorAction SilentlyContinue:"
    Get-Item "C:\NonExistentFile.txt" -ErrorAction SilentlyContinue
    Write-Host "Script continues..."
    
    # $? automatic variable
    Write-SubHeader -Title "Success Status (\$?)"
    Test-Path "C:\Windows"
    Write-Host "Last command succeeded: $?"
    
    # Custom error
    Write-SubHeader -Title "Custom Error"
    function Test-CustomError {
        param([int]$Value)
        
        if ($Value -lt 0) {
            throw "Value must be non-negative"
        }
        Write-Host "Value is valid: $Value"
    }
    
    try {
        Test-CustomError -Value -5
    }
    catch {
        Write-Host "Caught error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# ============================================================================
# 9. Working with Objects
# ============================================================================
function Show-ObjectOperations {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[9] Working with Objects"
    
    # Creating custom objects
    Write-SubHeader -Title "Custom Objects"
    $employee = [PSCustomObject]@{
        Name = "John Smith"
        Department = "IT"
        Salary = 75000
        HireDate = (Get-Date).AddYears(-2)
    }
    
    $employee | Format-List
    
    # Adding members dynamically
    Write-SubHeader -Title "Adding Members Dynamically"
    $employee | Add-Member -MemberType NoteProperty -Name "Email" -Value "john.smith@company.com"
    $employee | Add-Member -MemberType ScriptMethod -Name "GetYearsEmployed" -Value {
        return [math]::Round(((Get-Date) - $this.HireDate).Days / 365.25, 1)
    }
    
    Write-Host "Email: $($employee.Email)"
    Write-Host "Years employed: $($employee.GetYearsEmployed())"
    
    # Class definition (PowerShell 5.0+)
    Write-SubHeader -Title "Class Definition"
    class Person {
        [string]$Name
        [int]$Age
        
        Person([string]$name, [int]$age) {
            $this.Name = $name
            $this.Age = $age
        }
        
        [string]Introduce() {
            return "Hi, I'm $($this.Name) and I'm $($this.Age) years old."
        }
    }
    
    $person = [Person]::new("Alice", 30)
    Write-Host $person.Introduce()
}

# ============================================================================
# 10. File and Directory Operations
# ============================================================================
function Show-FileOperations {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[10] File and Directory Operations"
    
    # Get current location
    Write-Host "Current location: $(Get-Location)"
    
    # Test path
    $windowsPath = "C:\Windows"
    Write-Host "`nWindows directory exists: $(Test-Path $windowsPath)"
    
    # Get items
    Write-SubHeader -Title "Files in Current Directory"
    Get-ChildItem -Path "." -File | 
        Select-Object -First 5 Name, Length, LastWriteTime |
        Format-Table -AutoSize
    
    # Create and remove temporary file
    Write-SubHeader -Title "Temporary File Operations"
    $tempFile = Join-Path $env:TEMP "PowerShellDemo_$(Get-Random).txt"
    
    "Hello, PowerShell!" | Out-File -FilePath $tempFile
    Write-Host "Created: $tempFile"
    
    $content = Get-Content $tempFile
    Write-Host "Content: $content"
    
    Remove-Item $tempFile
    Write-Host "Deleted: $tempFile"
    
    # Path operations
    Write-SubHeader -Title "Path Operations"
    $fullPath = "C:\Users\Documents\file.txt"
    Write-Host "Directory: $(Split-Path $fullPath -Parent)"
    Write-Host "Filename: $(Split-Path $fullPath -Leaf)"
    Write-Host "Extension: $([System.IO.Path]::GetExtension($fullPath))"
}

# ============================================================================
# 11. Working with Dates and Times
# ============================================================================
function Show-DateTimeOperations {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[11] Date and Time Operations"
    
    # Current date and time
    $now = Get-Date
    Write-Host "Current date/time: $($now.ToString('yyyy-MM-dd HH:mm:ss'))"
    
    # Date formatting
    Write-SubHeader -Title "Date Formatting"
    Write-Host "Short date: $($now.ToShortDateString())"
    Write-Host "Long date: $($now.ToLongDateString())"
    Write-Host "Short time: $($now.ToShortTimeString())"
    Write-Host "ISO 8601: $($now.ToString('o'))"
    Write-Host "Custom: $($now.ToString('MMMM dd, yyyy'))"
    
    # Date arithmetic
    Write-SubHeader -Title "Date Arithmetic"
    $tomorrow = $now.AddDays(1)
    $nextWeek = $now.AddDays(7)
    $nextMonth = $now.AddMonths(1)
    
    Write-Host "Tomorrow: $($tomorrow.ToShortDateString())"
    Write-Host "Next week: $($nextWeek.ToShortDateString())"
    Write-Host "Next month: $($nextMonth.ToShortDateString())"
    
    # Time span
    Write-SubHeader -Title "Time Span"
    $startDate = Get-Date "2025-01-01"
    $endDate = Get-Date
    $timeSpan = $endDate - $startDate
    
    Write-Host "Days since Jan 1, 2025: $($timeSpan.Days)"
}

# ============================================================================
# 12. Regular Expressions
# ============================================================================
function Show-RegularExpressions {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[12] Regular Expressions"
    
    # Match operator
    Write-SubHeader -Title "Match Operator"
    $text = "My phone is 555-1234"
    if ($text -match '\d{3}-\d{4}') {
        Write-Host "Found phone number: $($Matches[0])"
    }
    
    # Replace with regex
    Write-SubHeader -Title "Replace with Regex"
    $input = "Hello123World456"
    $output = $input -replace '\d+', 'X'
    Write-Host "Original: $input"
    Write-Host "Replaced: $output"
    
    # Split with regex
    Write-SubHeader -Title "Split with Regex"
    $data = "apple,banana;cherry:date"
    $items = $data -split '[,;:]'
    Write-Host "Split items: $($items -join ' | ')"
    
    # Select-String (grep equivalent)
    Write-SubHeader -Title "Select-String"
    $content = @"
Line 1: Error occurred
Line 2: Success
Line 3: Another error
Line 4: Warning
"@
    
    $content -split "`n" | Select-String -Pattern "error" -AllMatches | ForEach-Object {
        Write-Host "  $($_.Line)"
    }
}

# ============================================================================
# 13. Hash Tables and Ordered Dictionaries
# ============================================================================
function Show-HashTables {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[13] Hash Tables"
    
    # Standard hash table
    Write-SubHeader -Title "Hash Table"
    $config = @{
        Server = "localhost"
        Port = 8080
        Timeout = 30
        EnableLogging = $true
    }
    
    Write-Host "Configuration:"
    $config.GetEnumerator() | ForEach-Object {
        Write-Host "  $($_.Key): $($_.Value)"
    }
    
    # Accessing values
    Write-Host "`nServer: $($config.Server)"
    Write-Host "Port: $($config['Port'])"
    
    # Ordered dictionary
    Write-SubHeader -Title "Ordered Dictionary"
    $ordered = [ordered]@{
        First = 1
        Second = 2
        Third = 3
    }
    
    Write-Host "Ordered:"
    $ordered.GetEnumerator() | ForEach-Object {
        Write-Host "  $($_.Key): $($_.Value)"
    }
}

# ============================================================================
# 14. Splatting
# ============================================================================
function Show-Splatting {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[14] Splatting"
    
    # Splatting with hash table
    $params = @{
        Name = "PowerShell"
        ForegroundColor = "Green"
        BackgroundColor = "Black"
        NoNewline = $false
    }
    
    Write-Host "Using splatting:"
    Write-Host @params
    
    # Splatting with array
    $arrayParams = @("Value1", "Value2", "Value3")
    Write-Host "`nArray splatting: $($arrayParams -join ', ')"
}

# ============================================================================
# 15. Advanced Features
# ============================================================================
function Show-AdvancedFeatures {
    [CmdletBinding()]
    param()
    
    Write-SectionHeader -Title "[15] Advanced Features"
    
    # Null-coalescing operator (PowerShell 7+)
    Write-SubHeader -Title "Null-Coalescing (PS 7+)"
    $value = $null
    $result = $value ?? "Default Value"
    Write-Host "Result: $result"
    
    # Null-conditional operator (PowerShell 7+)
    Write-SubHeader -Title "Null-Conditional (PS 7+)"
    $obj = $null
    $length = $obj?.Length
    Write-Host "Length: $($length ?? 'null')"
    
    # Script blocks
    Write-SubHeader -Title "Script Blocks"
    $scriptBlock = { param($x, $y) return $x * $y }
    $result = & $scriptBlock 6 7
    Write-Host "ScriptBlock result (6 * 7): $result"
    
    # Invoke-Expression (use with caution)
    Write-SubHeader -Title "Dynamic Execution"
    $command = "Get-Date | Select-Object -Property DayOfWeek"
    $output = Invoke-Expression $command
    Write-Host "Today is: $($output.DayOfWeek)"
    
    # Background jobs
    Write-SubHeader -Title "Background Jobs"
    $job = Start-Job -ScriptBlock {
        Start-Sleep -Seconds 2
        return "Job completed!"
    }
    
    Write-Host "Job ID: $($job.Id), State: $($job.State)"
    Wait-Job $job | Out-Null
    $jobResult = Receive-Job $job
    Remove-Job $job
    Write-Host "Job result: $jobResult"
}

# ============================================================================
# Main Execution
# ============================================================================

Clear-Host

Write-Host ""
Write-Host $('=' * 70) -ForegroundColor Cyan
Write-Host $Script:Title.PadLeft(($Script:Title.Length + 70) / 2) -ForegroundColor Cyan
Write-Host "Version: $Script:Version" -ForegroundColor Gray
Write-Host $('=' * 70) -ForegroundColor Cyan

try {
    Show-VariablesAndTypes
    Show-StringOperations
    Show-Operators
    Show-ControlFlow
    Show-Loops
    Show-Functions
    Show-PipelineOperations
    Show-ErrorHandling
    Show-ObjectOperations
    Show-FileOperations
    Show-DateTimeOperations
    Show-RegularExpressions
    Show-HashTables
    Show-Splatting
    Show-AdvancedFeatures
    
    Write-Host ""
    Write-Host $('=' * 70) -ForegroundColor Green
    Write-Host "All demonstrations completed successfully!" -ForegroundColor Green
    Write-Host $('=' * 70) -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Error "An error occurred: $($_.Exception.Message)"
    exit 1
}

# End of script