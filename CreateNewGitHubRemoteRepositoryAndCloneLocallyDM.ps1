$UserRepo = "ReplaceMe"
$ProjectDirectory = "$env:USERPROFILE\ProjectsDM"
$WorkingDirectory = $ProjectDirectory +"\"+ $UserRepo

"Setting the branch to push on (The default branch is called main) ..."
$Branch = "main"
"Current Branch: $Branch ..."

$GitHubUser = "djomo-moungoue"
$RemoteName = "https://github.com/$GitHubUser/$UserRepo.git"
$RepoGitIgnore = "Python"
$RepoDescription = "GitHub Repo Created Automatically"
$RepoLicence = "GNU General Public License v3.0"

if(!(Test-Path -Path $ProjectDirectory))
{# Project directory doesn't exist
	Write-Host
	"Creating the Project directory $ProjectDirectory ..."
	New-Item -ItemType Directory $ProjectDirectory
	Write-Host
}
elseif(!(Test-Path -Path $WorkingDirectory))
{# Working directory doesn't exist
	Write-Host
	"Setting the new location to $ProjectDirectory ..."
	Set-Location $ProjectDirectory

	"Creating a repository if Chocoley (choco) and Github CLI (gh) are intalled ..."
	gh repo create $UserRepo --description=$RepoDescription --add-readme --private --gitignore=$RepoGitIgnore --clone
}
else 
{
	"$WorkingDirectory already exists ..."
	Get-ChildItem $WorkingDirectory
}
