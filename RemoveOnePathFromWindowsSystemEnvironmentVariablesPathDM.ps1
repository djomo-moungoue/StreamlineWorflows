"Initializing the path to remove ..."
$removePath = ""
"Current list of paths ..."

"Creating the backup of the current env variables path"
$BackupEnvVarPath = "$env:USERPROFILE\BackupEnvVarPath.csv"
New-Item -ItemType File $BackupEnvVarPath -force
Set-Content -Path $BackupEnvVarPath -Value $env:PATH
$BackupContent = (Get-Content $BackupEnvVarPath).Split(';')
$BackupContent

"Removig the path if it already exists ..."
$arrPath = $env:Path -split ';' | Where-Object {$_ -notlike "$removePath*"}
$env:Path = $arrPath -join ';'

"New list of paths ..."
$env:PATH -split ';'