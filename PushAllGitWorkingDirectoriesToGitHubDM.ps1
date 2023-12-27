$GitHubUser = "djomo-moungoue"
$UserRepo = "StreamlineWorflows"
$ProjectDirectory = "$env:USERPROFILE\ProjectsDM"
$WorkingDirectory = $ProjectDirectory +"\"+ $UserRepo

"Setting the branch to push on (The default branch is called main) ..."
$Branch = "main"
"Current Branch: $Branch ..."

if(!(Test-Path -Path $ProjectDirectory))
{# Project directory doesn't exist
	Write-Host
	"Creating the Project directory $ProjectDirectory ..."
	New-Item -ItemType Directory $ProjectDirectory
	Write-Host
	"Creating the Working directory $WorkingDirectory ..."
	New-Item -ItemType Directory $WorkingDirectory
}
elseif(Test-Path -Path $WorkingDirectory)
{# Working directory exists
	Write-Host
	"Setting the new location to $WorkingDirectory ..."
	Set-Location $WorkingDirectory

	Write-Host
	"Adding the files in the local repository and stages them for commit ... "
	git add . -f

	Write-Host
	"Commiting the tracked changes and prepares them to be pushed to a remote repository ..."
	git commit -m "Automated Commit"

	Write-Host
	"Pushing change to the remote repository https://github.com/$GitHubUser/$UserRepo.git ..."
	Write-Host
	git push origin main
}
else 
{
	Write-Host
	"$WorkingDirectory doesn't exist.  ..."
}

