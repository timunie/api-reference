param (
	[Parameter(HelpMessage="Enter the Avalonia branch to use as input. The default is 'release/latest'")]
	[string]$branchName
)

if (-Not $branchName){
	$branchName = "release/latest"
}

# make sure submodules are initialized yet 
git submodule update --init --recursive

# change dir into Avalonia submodule and checkout requested branch. 
Set-Location .\ext\Avalonia
git fetch
git checkout $branchName
Set-Location ..\..

# Commit changes
git add .\ext\*
git commit -m "Updated Avalonia submodule to target branch $branchName"

# Update git submodules
git submodule update --init --recursive --force
