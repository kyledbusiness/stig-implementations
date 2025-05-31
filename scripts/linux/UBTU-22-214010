<#
.SYNOPSIS
    This Bash script ensures that the Advance Package Tool (APT) is configured to prevent the installation of unauthorized packages by verifying their digital signatures.

.NOTES
    Author          : Kyle Davis
    Date Created    : 2025-01-31
    Last Modified   : 2025-01-31
    Version         : 1.0
    STIG-ID         : UBTU-22-214010

.TESTED ON
    Date(s) Tested  : 2025-01-31
    Tested By       : Kyle Davis
    Systems Tested  : Ubuntu 22.04 LTS
    Bash Version    :   

.USAGE
    Run the script with root privileges to apply the remediation.
    Example syntax:
    $ sudo ./UBTU-22-214010.sh 
#>

#!/bin/bash

CONFIG_FILE="/etc/apt/apt.conf.d/00-stig-allowunauthenticated"

# Ensure the configuration file exists and contains the correct setting
echo 'APT::Get::AllowUnauthenticated "false";' | tee "$CONFIG_FILE" > /dev/null

echo "Remediation complete: APT is now configured to prevent unauthorized package installations."

# Verify the setting
grep -i allowunauthenticated /etc/apt/apt.conf.d/*
