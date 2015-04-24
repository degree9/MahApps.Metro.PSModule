param($installPath, $toolsPath, $package, $project)
Find-Package -Name MahApps.Metro -MinimumVersion 1.1.3-ALPHA021 | Install-Package -Verbose -Destination "$PSScriptRoot\lib"