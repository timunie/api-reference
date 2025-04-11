# Avalonia API-Reference
This project generates the [Avalonia](https://avaloniaui.net) API reference documentation.

## How it works
- Avalonia is linked via `.gitmodule` for the given release branch
- [Sandcastle Help File Builder](https://github.com/EWSoftware/SHFB) reads the Avalonia API info and generates `MDX`-files
- [Docusaurus]() uses the created `MDX`-files to generate a static website

## How to build
It is important to mind the build order.
1. build all Avalonia projects (you can use `.\src\ApiDocumentation\DocumentationSources.slnx` for this)
2. build any custom SHFB plug-ins
3. build the SHFB project
4. build or preview the docs website

> [!NOTE]
> Use the `build.ps1` file to run the build. Usage:
> ```ps1
> # -version: specify the Avalonia version to document. If this parameter is not set, `AvaloniaVersion.txt` will be used instead. 
> # -preview: Add this switch if you want to open the preview of the website. If this switch is missing, an optimized build will be created
> .\build.ps1 -version 11.2.0 -preview
> ```

## Generate the API docs for newer Avalonia version
Open `AvaloniaVersion.txt` and edit it's content to match exact Avalonia version to use. 

## Known limitations
- The API-Reference is only available for a single version as of now. 
- The search functionality is missing, but should be added soon.