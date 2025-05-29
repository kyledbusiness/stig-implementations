<#
.SYNOPSIS
    This PowerShell script configures BitLocker advanced startup settings by modifying registry values to enforce TPM and PIN-based authentication.

.NOTES
    Author          : Kyle Davis
    Date Created    : 2025-01-24
    Last Modified   : 2025-01-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

.TESTED ON
    Date(s) Tested  : 2025-01-24
    Tested By       : Kyle Davis
    Systems Tested  : Windows 11 Pro
    PowerShell Ver. :   

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-00-000031.ps1 
#>

# Create or modify the registry key for BitLocker advanced startup settings
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" -Force

# Set the UseAdvancedStartup value to 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" -Name "UseAdvancedStartup" -Value 1 -Type DWord

# Set the UseTPMPIN value to 1 (or 2 if network unlock is used)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" -Name "UseTPMPIN" -Value 1 -Type DWord

# Set the UseTPMKeyPIN value to 1 (or 2 if network unlock is used)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" -Name "UseTPMKeyPIN" -Value 1 -Type DWord

# Verify the settings
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$requiredValues = @{
    UseAdvancedStartup = 1
    UseTPMPIN = 1
    UseTPMKeyPIN = 1
}

foreach ($valueName in $requiredValues.Keys) {
    $currentValue = Get-ItemProperty -Path $registryPath -Name $valueName | Select-Object -ExpandProperty $valueName -ErrorAction SilentlyContinue
    if ($currentValue -eq $requiredValues[$valueName]) {
        Write-Output "The registry value '$valueName' is correctly configured to $currentValue."
    } else {
        Write-Output "The registry value '$valueName' is not correctly configured. Current value: $currentValue. Expected: $($requiredValues[$valueName])."
    }
}
