function prompt {
    $logFile = "C:\Users\JakeDerkowski\Documents\PowerShell Log.txt"
    $lastCommand = get-history –count 1
    if ($lastCommand)
    {
        # There is a command in history.
        $whenDidItRun = Get-Date –Date $lastCommand.StartExecutionTime –Format 'yyyy MMMM dd HH:mm:ss'
        $logEntry = "$whenDidItRun> $($lastCommand.CommandLine)"

        Add-Content –Value $logEntry –Path $logFile

        Write-Host $logEntry –ForegroundColor DarkGreen
        "> "
    }
    else
    {
        # There is no command in history.
        # You just opened PowerShell.
        "> "
    }
}

clear

# Quick Access
$qa = @{
    desktop = "C:\Users\JakeDerkowski\Desktop"
    downloads = "C:\Users\JakeDerkowski\Downloads"
}

# Import-Module –Name Appx –UseWindowsPowerShell; Break;

# Windows Build Information
$buildInfo = [PSCustomObject]@{
  Version     = Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name DisplayVersion
  InstalledOn = [DateTime]::FromFileTime((Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name InstallTime))
  OSBuild     = "{0}.{1}" -f (Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name CurrentBuild), (Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name UBR)
  Edition     = Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name ProductName
  ReleaseId   = Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name ReleaseId
}




New-Alias –Name vscode –Value "C:\Users\JakeDerkowski\AppData\Local\Programs\Microsoft VS Code\bin\Code.cmd"



#
#
#
#
# Set-PSReadLineKeyHandler –Key 'Alt+(' `
#                          –BriefDescription ParenthesizeSelection `
#                          –LongDescription "Put parenthesis around the selection or entire line and move the cursor to after the closing parenthesis" `
#                          –ScriptBlock {
#     param($key, $arg)
#
#     $selectionStart = $null
#     $selectionLength = $null
#     [Microsoft.PowerShell.PSConsoleReadLine]::GetSelectionState([ref]$selectionStart, [ref]$selectionLength)
#
#     $line = $null
#     $cursor = $null
#     [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
#     if ($selectionStart -ne -1)
#     {
#         [Microsoft.PowerShell.PSConsoleReadLine]::Replace($selectionStart, $selectionLength, '(' + $line.SubString($selectionStart, $selectionLength) + ')')
#         [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($selectionStart + $selectionLength + 2)
#     }
#     else
#     {
#         [Microsoft.PowerShell.PSConsoleReadLine]::Replace(0, $line.Length, '(' + $line + ')')
#         [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
#     }
# }
