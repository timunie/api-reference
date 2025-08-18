param (
	[Parameter(HelpMessage="Enter the Avalonia branch to use as input. The default is 'release/latest'")]
	[string]$branchName
)

if (-Not $branchName){
	$branchName = "release/latest"
}

# change dir into Avalonia submodule and checkout requested branch. 
Set-Location .\ext\Avalonia
git fetch
git checkout $branchName
Set-Location ..\..

# Update git submodules
git submodule update --init --remote --depth=1 --force
git submodule update --init --recursive

git add .\ext\*
git commit -m "Updated Avalonia submodule to target branch $branchName"