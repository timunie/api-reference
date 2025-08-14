param (
	[Parameter(HelpMessage="Enter the Avalonia version to document", mandatory=$true)]
	[string]$version
)

New-item ./AvaloniaVersion.txt -ItemType File -Value  $version -Force

git add ./AvaloniaVersion.txt
git commit -m "Updated to Avalonia version $($version)"