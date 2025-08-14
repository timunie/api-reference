param (
	[Parameter(HelpMessage="Enter the Avalonia branch to use as input. The default is 'release/latest'")]
	[string]$branchName
)

if (-Not $branchName){
	$branchName = "release/latest"
}

# Update git submodules
git submodule set-branch --branch $branchName ext/Avalonia
git submodule sync --recursive
git submodule update --init --recursive --remote

git add .\.gitmodules
git add .\ext\*