param (
	[Parameter(HelpMessage="Enter the Avalonia version to document")]
	[string]$version
)

if ($PSBoundParameters.ContainsKey("version")){
	New-item ./AvaloniaVersion.txt -ItemType File -Value  $version -Force
}
else{
	$version = Get-Content ./AvaloniaVersion.txt
}

# Update git submodules
git submodule set-branch --branch release/$version ext/Avalonia
git submodule sync --recursive
git submodule update --init --recursive --remote

git submodule foreach -q --recursive 'branch="$(git config -f $toplevel.gitmodules submodule.$name.branch)"; git checkout $branch'