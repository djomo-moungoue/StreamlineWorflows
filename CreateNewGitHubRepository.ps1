$Directory = "StreamlineWorklows"
$ProjectDirectory = "$env:USERPROFILE\projectsza"
$WorkingDirectory = $ProjectDirectory +"\"+ $Directory
if(!(Test-Path -Path $ProjectDirectory))
{# Project directory doesn't exist
	"Creating the Project directory $ProjectDirectory ..."
	New-Item -ItemType Directory $ProjectDirectory
	"Creating the Working directory $WorkingDirectory ..."
	New-Item -ItemType Directory $WorkingDirectory
}
elseif(!(Test-Path -Path $WorkingDirectory))
{# Working directory doesn't exist
	"Creating the Working directory $WorkingDirectory ..."
	New-Item -ItemType Directory $WorkingDirectory
}
"Setting the new location to $WorkingDirectory ..."
Set-Location $WorkingDirectory

if(!(Test-Path -Path "$WorkingDirectory\README.md"))
{
	"Creating the README.md file ..."
	echo "# $Directory" >> README.md
}

"Ininiatialing Git ..."
git init

"Adding README.md to the Git index ... "
git add . -f

"Commiting ..."
git commit -m "first commit"

"Creating an moving to the branch main ..."
git branch -M main

"Adding a new remote repository"
git remote add origin https://github.com/djomo-moungoue/$Directory.git
git push --set-upstream origin main # alias -u

<#
Problem

remote: Repository not found.
fatal: repository 'https://github.com/djomo-moungoue/FlutterApps2.git/' not found

Solution

Open Control Panel from the Start menu.
Select User Accounts.
Select the "Credential Manager".
Click on "Manage Windows Credentials".
Delete any credentials related to Git or GitHub.
Once you deleted all then try to clone again.

…or create a new repository on the command line
echo "# flutter-beginners-tutorial" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/djomo-moungoue/flutter-beginners-tutorial.git
git push -u origin main

…or push an existing repository from the command line
git remote add origin https://github.com/djomo-moungoue/flutter-beginners-tutorial.git
git branch -M main
git push -u origin main

below is used to add a new remote:
git remote add origin git@github.com:User/UserRepo.git

below is used to change the url of an existing remote repository:
git remote set-url origin git@github.com:User/UserRepo.git

below will push your code to the master branch of the remote repository defined with origin and -u let you point your current local branch to the remote master branch:
git push -u origin main
#>