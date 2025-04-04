param (
	[Parameter(HelpMessage="Opens a preview of the website")]
	[switch]$preview,
	
	[Parameter(HelpMessage="Produces an optimized website")]
	[switch]$build
)

# Unpack any artifacts if available
if(Test-Path .\artifacts.zip){
   Expand-Archive -Path ./artifacts.zip -DestinationPath ./ -Force
}

# Make sure all dependencies are installed and up to date
pnpm install
	
# preview the website if preview switch is on
if($preview.IsPresent){
	pnpm start
}

# build the website if build switch is on
if($build.IsPresent){
	pnpm build 
}