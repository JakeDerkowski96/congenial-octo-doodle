# EXAMPLE TO TRUST REPOSITORY
# $parameters = @{
#   Name = "myNuGetSource"
#   SourceLocation = "https://www.myget.org/F/powershellgetdemo/api/v2"
#   PublishLocation = "https://www.myget.org/F/powershellgetdemo/api/v2/Packages"
#   InstallationPolicy = 'Trusted'
# }

# Register-PSRepository @parameters
# Get-PSRepository

Install-Module -Name PowerShellGet -Force
Install-Module winget
