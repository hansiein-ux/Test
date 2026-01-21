# PowerShell Commands Set 1.1
# This script demonstrates various PowerShell commands and their usage.

# Execution Policy Commands
get-executionpolicy
Set-ExecutionPolicy Restricted -Scope Process
Get-ExecutionPolicy -List
Set-ExecutionPolicy ByPass -Scope Process
Get-ExecutionPolicy
Set-ExecutionPolicy ByPass -Scope CurrentUser
Get-ExecutionPolicy -List
Set-ExecutionPolicy RemoteSigned -Scope localMachine
Get-ExecutionPolicy -List

# Code Signing Commands
#Create a self-signed code signing certificate
New-SelfSignedCertificate -Type CodeSigningCert -Subject "CN=PowerShellCodeSigning"
#List certificates in the CurrentUser and LocalMachine stores
Get-ChildItem -Path Cert:\CurrentUser\My
#Sign a script with the created certificate
$cert = Get-ChildItem -Path Cert:\localMachine\My | Where-Object { $_.Subject -eq "CN=PowerShellCodeSigning" }
#Sign the script
Set-AuthenticodeSignature -FilePath "D:\yg\Training\Powershell\xml-editing.ps1" -Certificate $cert
#Verify the signature of the script
Get-AuthenticodeSignature -FilePath "D:\yg\Training\Powershell\xml-editing.ps1"

# Get commands with specific verbs and nouns
Get-Command -Verb Get -Noun Process
Get-Command -Verb Set -Noun Service
Get-Command -Verb Remove -Noun Item
Get-Command -Verb Get*
Get-Command -Noun Module*
Get-Command *event*

# Get help for specific commands
Get-Help Get-Date -Full
Get-Help Get-Date -Examples
Get-Help Get-Date -Detailed

#Get date and time information
Get-Date
Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Get-Date -UFormat "%Y-%m-%d %H:%M:%S"
Get-Date | Select-Object Day, Month, Year, Hour, Minute, Second
Get-Date | AddDays 5
(Get-Date).Adddays(10)
(Get-Date).AddHours(-3)
(Get-Date).AddMinutes(30)
(Get-Date).AddSeconds(120)
(Get-Date).Add((New-TimeSpan -Days 2 -Hours 5 -Minutes 30))
(Get-Date).tostring("yyyy-MM-dd HH:mm:ss")


Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
Get-Process | Where-Object { $_.CPU -gt 100 } | Sort-Object CPU -Descending | Select-Object -First 5
$processitem = Get-Process | Where-Object { $_.CPU -gt 100 -and $_.Handles -gt 1000 } | Sort-Object CPU -Descending | Select-Object -First 5 | Select-Object Name, CPU, Handles
$processitem | select-object -First 3
write-host $processitem | Format-Table -AutoSize

Get-Service | Where-Object { $_.Status -eq 'Running' } | Sort-Object Name
Get-Service | Where-Object { $_.Status -eq 'Stopped' } | Sort-Object Name
Get-Service | Where-Object { $_.StartType -eq 'Automatic' -or $_.Status -eq 'Stopped' } | Sort-Object Name       
Get-Service | where-Object {$_.DisplayName -like 'windows*'} | Sort-Object Name

Get-childitem | Get-Member
Get-Command *service*

Get-ChildItem D:\temp
Get-ChildItem d:\temp -Recurse
Get-ChildItem D:\temp | Where-Object { $_.Length -gt 1MB } | Sort-Object Length -Descending | Select-Object -First 10
get-childitem D:\temp | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force

Get-EventLog -LogName Application -Newest 10
Get-EventLog -LogName System -EntryType Error -Newest 10
Get-EventLog -LogName Security -After (Get-Date).AddHours(-1) -Newest 10
Get-EventLog -LogName Application | Where-Object { $_.EventID -eq 1000 } | Sort-Object TimeGenerated -Descending | Select-Object -First 5

Get-ChildItem d:\temp | foreach-object { $_.Name }
Get-Process | foreach-object {$_} | Where-Object {$_.CPU -gt 50}| foreach-object {$_.Name} |Select-Object -First 10
Get-Process | Where-Object {$_.CPU -gt 50} | ForEach-Object { Write-Output "Process Name: $($_.Name), CPU Usage: $($_.CPU)" }

Get-Date | Get-Member

Get-History
Invoke-History -Id 74
Clear-History

foreach ($x in Get-process | where-object {$_.CPU -gt 50} | Sort-object -Descending CPU | select-object -first 10 )
{
    if ($x.handles -lt 1000)
        {
            write-host $x.ProcessName -ForegroundColor White -NoNewline
            write-host (" - "+$x.Handles) -ForegroundColor White
        }

        if ($x.handles -gt 1000 -and $x.Handles -lt 2000)
        {
            write-host $x.ProcessName -ForegroundColor Yellow -NoNewline
            write-host (" - "+$x.Handles) -ForegroundColor Yellow
        }

        if ($x.handles -gt 1000 -and $x.Handles -lt 2000)
        {
            write-host $x.ProcessName -ForegroundColor DarkRed -BackgroundColor White -NoNewline
            write-host (" - "+$x.Handles) -ForegroundColor DarkRed -BackgroundColor White
        }
    
}
