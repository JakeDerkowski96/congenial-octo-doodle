if ($PSVersionTable.PSVersion.Major -eq 6)
{
    $host.ui.rawui.WindowTitle = "PowerShell 6"
}
else {
    $host.ui.rawui.WindowTitle = "Mike's PowerShell"
}

function prompt {
    $logFile = "C:\Users\Michael\Documents\PowerShell Log.txt"
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
    blog = "C:\Users\Michael\Blog"
    cSharp = "C:\Users\Michael\C Sharp"
    desktop = "C:\Users\Michael\Desktop"
    dev = "C:\Users\Michael\Dev.to"
    downloads = "C:\Users\Michael\Downloads"
    journal = "C:\Users\Michael\Journal"
    vim = "C:\Users\Michael\Desktop\Vim"
}

# Windows Build Information

# Appx – Import-Module: Operation is not supported on this platform. (0x80131539)
# https://github.com/PowerShell/PowerShell/issues/13138

# How do I find the version of my Windows Feature Experience Pack?
# https://stackoverflow.com/questions/64831517/how-do-i-find-the-version-of-my-windows-feature-experience-pack

Switch ($PSVersionTable.PSVersion.ToString())
{
  "7.1.0" {Import-Module –Name Appx –UseWindowsPowerShell; Break}
}

$buildInfo = [PSCustomObject]@{
  Version     = Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name DisplayVersion
  InstalledOn = [DateTime]::FromFileTime((Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name InstallTime))
  OSBuild     = "{0}.{1}" -f (Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name CurrentBuild), (Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name UBR)
  Edition     = Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name ProductName
  ReleaseId   = Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name ReleaseId
  Experience  = (Get-AppxPackage 'MicrosoftWindows.Client.CBS').Version
}

New-Alias –Name eiffel –Value "C:\Program Files\Eiffel Software\EiffelStudio 19.05 GPL\studio\spec\win64\bin\estudio.exe"
New-Alias –Name firefox –Value "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
New-Alias –Name hourglass –Value "C:\Program Files (x86)\Hourglass\Hourglass.exe"
New-Alias –Name LOcalc –Value "C:\Program Files\LibreOffice\program\scalc.exe"
New-Alias –Name notepad++ –Value "C:\Program Files (x86)\Notepad++\notepad++.exe"
New-Alias –Name paint –Value "C:\Program Files\paint.net\PaintDotNet.exe"
New-Alias –Name pdf –Value "C:\Program Files\SumatraPDF\SumatraPDF.exe"
New-Alias –Name vim –Value "C:\Program Files (x86)\Vim\vim82\vim.exe"
New-Alias –Name vivaldi –Value "C:\Users\Michael\appdata\Local\Vivaldi\Application\vivaldi.exe"
New-Alias –Name vscode –Value "C:\Users\Michael\AppData\Local\Programs\Microsoft VS Code\bin\Code.cmd"
New-Alias –Name writer –Value "C:\Program Files\LibreOffice\program\swriter.exe"

function compile {  & csc –nologo .\hello.cs  }
function Copy-LogonImages {  & "C:\Users\Michael\Blog\copy logon images\copy logon images.ps1"  }
function dryer {  & "C:\Program Files (x86)\Hourglass\Hourglass.exe" —title "Dryer" "1h 10m"  }
function duck ([string] $searchTerms)
{
    Add-Type –AssemblyName System.Web

    $firstPart = "https://duckduckgo.com/?q="
    $lastPart = "&t=ffsb&ia=web"

    $encodedTerms = [System.Web.HttpUtility]::UrlEncode($searchTerms)

    $address = "{0}{1}{2}" -f $firstPart, $encodedTerms, $lastPart

    start-process $address
}
function environment {  & "C:\Windows\system32\rundll32.exe" sysdm.cpl,EditEnvironmentVariables  }
function fn
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true,
        ValueFromPipeline=$true)]
        [double] $number
    )

    Process
    {
        "{0:n0}" -f $number
    }
}
function Start-Hourglass ([string] $myInput)
{
  $regularExpression = "^ *(\w[\w \&\\\/\-]+\w\??) +(\d+ minutes)$"
  $myInput -match $regularExpression | Out-Null
  Invoke-Expression "hourglass –title `"$($matches[1])`" $($matches[2])"
}
function meld {  & "C:\Program Files (x86)\Meld\Meld.exe"  }
function mojeek ([string] $searchTerms)
{
    Add-Type –AssemblyName System.Web

    $firstPart = "https://www.mojeek.com/search?q="
    $lastPart = ""

    $encodedTerms = [System.Web.HttpUtility]::UrlEncode($searchTerms)

    $address = "{0}{1}{2}" -f $firstPart, $encodedTerms, $lastPart

    start-process $address
}
function resourcemonitor {  & "$env:WINDIR\system32\perfmon.exe" "/res"  }
function run {  & mono .\hello.exe  }
Function Set-SoundVolume
{
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,100)]
        [Int]
        $volume
    )

    # Calculate number of key presses.
    $keyPresses = [Math]::Ceiling( $volume / 2 )

    # Create the Windows Shell object.
    $obj = New-Object –ComObject WScript.Shell

    # Set volume to zero.
    1..50 | ForEach-Object {  $obj.SendKeys( [char] 174 )  }

    # Set volume to specified level.
    for( $i = 0; $i -lt $keyPresses; $i++ )
    {
        $obj.SendKeys( [char] 175 )
    }
}
New-Alias –Name "ssv" Set-SoundVolume
function stamp ([int] $choice = 0)
{
  switch ($choice)
  {
    1 {
      "$(get-date –format 'dddd, MMMM d, yyyy h:mm:ss tt')`n" | Set-Clipboard
    }
    2 {
      "`n`n$(get-date –format 'dddd, MMMM d, yyyy h:mm:ss tt')`n`n" | Set-Clipboard
    }
    default {
      "$(get-date –format 'dddd, MMMM d, yyyy h:mm:ss tt')" | Set-Clipboard
    }
  }
}
function sello ([int] $opción = 0)
{
    $fecha = Get-Date
    $ristra = 'dddd, MMMM d, yyyy h:mm:ss tt'
    $cultura = Get-Culture es–MX

    #$fecha.ToString($ristra, $cultura)

    switch ($opción)
  {
    1 {
      "$($fecha.ToString($ristra, $cultura))`n" | Set-Clipboard
    }
    2 {
      "`n`n$($fecha.ToString($ristra, $cultura))`n`n" | Set-Clipboard
    }
    default {
      "$($fecha.ToString($ristra, $cultura))" | Set-Clipboard
    }
  }
}
function thunderbird {  & "C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe"  }
function volume {  & "C:\Windows\System32\SndVol.exe" –m 131074000  }
function Wait-Computer ()
{
  Add-Type –Assembly System.Windows.Forms
  $state = [System.Windows.Forms.PowerState]::Suspend
  [System.Windows.Forms.Application]::SetSuspendState($state, $false, $false) | Out-Null
}
function washingmachine {  & "C:\Program Files (x86)\Hourglass\Hourglass.exe" —title "Washing Machine" "35m"  }

. "C:\Users\Michael\Blog\password generator\Get-Password.ps1"


# Announcing PSReadLine 2.1+ with Predictive IntelliSense | PowerShell
# https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/

# https://github.com/PowerShell/PSReadLine/blob/master/PSReadLine/SamplePSReadLineProfile.ps1#L348-L374

# Sometimes you want to get a property of invoke a member on what you've entered so far
# but you need parens to do that.  This binding will help by putting parens around the current selection,
# or if nothing is selected, the whole line.
Set-PSReadLineKeyHandler –Key 'Alt+(' `
                         –BriefDescription ParenthesizeSelection `
                         –LongDescription "Put parenthesis around the selection or entire line and move the cursor to after the closing parenthesis" `
                         –ScriptBlock {
    param($key, $arg)

    $selectionStart = $null
    $selectionLength = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetSelectionState([ref]$selectionStart, [ref]$selectionLength)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    if ($selectionStart -ne -1)
    {
        [Microsoft.PowerShell.PSConsoleReadLine]::Replace($selectionStart, $selectionLength, '(' + $line.SubString($selectionStart, $selectionLength) + ')')
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($selectionStart + $selectionLength + 2)
    }
    else
    {
        [Microsoft.PowerShell.PSConsoleReadLine]::Replace(0, $line.Length, '(' + $line + ')')
        [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
    }
}
