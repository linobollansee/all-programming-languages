# PowerShell Script
Write-Host "Hello, World!"

function Greet {
    param(
        [string]$Name
    )
    Write-Host "Hello, $Name!"
}

Greet -Name "PowerShell"