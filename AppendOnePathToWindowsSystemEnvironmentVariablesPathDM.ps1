
#$addPath = "C:\Users\yesse\AppData\Local\Programs\Microsoft VS Code\bin"
param([string]$PathToAppend="")
"Path to append ..."
$PathToAppend

Write-Host
"Creating the backup of the current env variables path ..."
Write-Host
$BackupEnvVarPath = "$env:USERPROFILE\BackupEnvVarPath.csv"
New-Item -ItemType File $BackupEnvVarPath -force
Set-Content -Path $BackupEnvVarPath -Value $env:PATH
$BackupContent = (Get-Content $BackupEnvVarPath).Split(';')

Write-Host
"Current Windows System Environment Variable PATH ..."
Write-Host
$BackupContent

Write-Host
"Removig the path if it already exists ..."
Write-Host
$arrPath = $env:Path -split ';' | Where-Object {$_ -notlike "$PathToAppend*"}

Write-Host
"Appending the new path at the end of existing environment paths existing ..."
Write-Host
$env:Path = ($arrPath + $PathToAppend) -join ';'

Write-Host
"Updated Windows System Environment Variable PATH ..."
Write-Host
$env:PATH -split ';'