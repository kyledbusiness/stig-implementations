<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Kyle Davis
    Date Created    : 2025-01-21
    Last Modified   : 2025-01-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-01-21
    Tested By       : Kyle Davis
    Systems Tested  : Windows 11 Pro
    PowerShell Ver. :   

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AU-000500.ps1 
#>

# Create or modify the registry key for the Application event log max size
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" -Force

# Set the MaxSize value to 32,768 (0x00008000)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" -Name "MaxSize" -Value 32768 -Type DWord

# May need to run the second command seperately, sometimes PowerShell doesn't like to do both of them at once so the MaxSize value wont change.
