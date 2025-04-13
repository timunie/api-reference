param (
	[Parameter(HelpMessage="Enter the Avalonia version to document")]
	[string]$version,
   
	[Parameter(HelpMessage="Opens a preview of the website")]
	[switch]$preview,
	
	[Parameter(HelpMessage="Produces an optimized build of the website")]
	[switch]$build,
	
	[Parameter(HelpMessage="Packs the generated MD-files into artifacts.zip")]
	[switch]$pack
)

if ($version.IsPresent){
	New-item ./AvaloniaVersion.txt -ItemType File -Value  $version -Force
}
else{
	$version = Get-Content ./AvaloniaVersion.txt
}

# Update git submodules
git config --file=.gitmodules submodule.Avalonia.branch "release/$version"  # change branch to requested version
git submodule update --init --recursive

# set SHFBRoot
$env:SHFBRoot = ".\src\packages\ewsoftware.shfb\2025.3.22\tools\"

# Define a list of dotNET projects to build
$projectsToBuild = @(
    # Build Avalonia dependencies
	"ext/Avalonia/src/Markup/Avalonia.Markup.Xaml/Avalonia.Markup.Xaml.csproj",
	"ext/Avalonia/src/tools/Avalonia.Generators/Avalonia.Generators.csproj",
	"ext/Avalonia/src/Avalonia.Build.Tasks/Avalonia.Build.Tasks.csproj",
	
    # Build all documentation sources. Check the slnx file to add or remove additional projects to use.
	"src/ApiDocumentation/DocumentationSources.slnx",
	
	# Sandcastle documentation
	"src/DocusaurusExportPlugin/DocusaurusExportPlugin.csproj",
	"src/DocusaurusPresentationStyle/DocusaurusPresentationStyle.csproj",
	"src/AvaloniaAttributesPlugin/AvaloniaAttributesPlugIn.csproj",
	"src/ApiDocumentation/ApiDocumentation.shfbproj"
)

foreach ($proj in $projectsToBuild){
	dotnet build $proj -c Release 
	Write-Host "built $proj"
}

# preview the website if preview switch is on
if($preview.IsPresent){
	pushd ./website
	./build.ps1 -preview
	popd
}

# build the website if build switch is on
if($build.IsPresent){
	pushd ./website
    ./build.ps1 -build
	popd
}

# pack the md-files and version settings if pack switch is on
if($pack.IsPresent){
	Compress-Archive -Path ./website/docs, ./website/versionSettings.js -DestinationPath ./artifacts.zip -Force
}
