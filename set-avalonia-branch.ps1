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
git submodule foreach -q --recursive 'branch="$(git config -f $toplevel.gitmodules submodule.$name.branch)"; git checkout $branch'

git add .\.gitmodules
git add .\ext\*