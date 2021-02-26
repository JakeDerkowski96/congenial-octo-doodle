

# variable set to the critical OS information
$buildInfo = [PSCustomObject]@{
  Version     = Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name DisplayVersion
  InstalledOn = [DateTime]::FromFileTime((Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name InstallTime))
  OSBuild     = "{0}.{1}" -f (Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name CurrentBuild), (Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name UBR)
  Edition     = Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name ProductName
  ReleaseId   = Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" –Name ReleaseId
  Experience  = (Get-AppxPackage 'MicrosoftWindows.Client.CBS').Version
}

New-Alias –Name pdf –Value "C:\Program Files\SumatraPDF\SumatraPDF.exe"
New-Alias –Name vscode –Value "C:\Users\Michael\AppData\Local\Programs\Microsoft VS Code\bin\Code.cmd"
