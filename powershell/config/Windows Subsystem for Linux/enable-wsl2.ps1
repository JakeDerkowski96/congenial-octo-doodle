# Step 0: Check Privileges

# Check if powershell is launched as elevated

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if(-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Write-Warning "Please run PowerShell as administrator"
        exit
}

# Step 1. Enable WSL

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart


# Step 2. Enable ‘Virtual Machine Platform’ 

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart


# Step 3. Set WSL 2 as default

wsl --set-default-version 2

# Step 4. Install a distro

Write-Host "Step 4. Install a distro"

Write-Host "Now download a linux machine from the Windows Store"


Start-Sleep -s 2
Write-Host " Link to Ubuntu VM: https://www.microsoft.com/en-gb/p/ubuntu-2004-lts/9n6svws3rx71 "
Write-Host "Once downloaded and an user is configured for the machine, you will have to set the 'WSL' version to 2 manually by running this command:

'wsl.exe --set-version $DISTRO 2'


where $DISTRO is the name of the downloaded VM"

