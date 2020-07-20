dotnet bump-version patch
dotnet pack -c Release
$packageFileName = (Get-ChildItem bin/Release  | Sort-Object {$_.LastWriteTime} | Select-Object -last 1).name
nuget.exe push -Source "global-packages"  -ApiKey VSTS bin/Release/$packageFileName 
Set-Location ../
