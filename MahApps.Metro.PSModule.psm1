#TODO: Fix MahApps.Metro Dependency

IF ((Test-Path "$PSScriptRoot\lib\MahApps.Metro.1.1.3-ALPHA021\lib\net40\MahApps.Metro.dll") -ne $true) {

  Find-Package MahApps.Metro -MinimumVersion "1.1.3-ALPHA021" | Install-Package -Destination "$PSScriptRoot\lib" -Verbose -ForceBootstrap -ErrorAction SilentlyContinue

}

#Autoload MahApps.Metro Type
Add-Type -Path "$PSScriptRoot\lib\MahApps.Metro.1.1.3-ALPHA021\lib\net40\MahApps.Metro.dll"

IF ((Test-Path "$PSScriptRoot\Generated\") -ne $true) {

  #Generate UIModule Cmdlets
  Add-UIModule -Path "$PSScriptRoot\lib\MahApps.Metro.1.1.3-ALPHA021\lib\net40\MahApps.Metro.dll" -Name "$PSScriptRoot\Generated\MahApps.Metro.psm1"
  
  #Rename Generated Files
  Rename-Item -Path "$PSScriptRoot\Generated\MahApps.Metro.psm1" -NewName "$PSScriptRoot\Generated\MahApps.Metro.ps1"

}

#Autoload Files
. "$PSScriptRoot\Generated\MahApps.Metro.ps1"