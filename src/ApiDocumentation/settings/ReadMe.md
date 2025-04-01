## Grouing by Assembly / nuget-package

This API Reference uses Grouping by nuget-Package. Since this cannot be done fully automatic,
the mapping is done in AssemblyPackageMapping. To configue it use the following schema:

```json
{	
    "NameOfTheAssembly" : "Nuget-PackageName",
    
	[...],
	
	"Avalonia" : "Avalonia",
	"Avalonia.Analyzers" : "Avalonia",
    
	[...]
}
```

> [!WARNING]
> Since this is an dictionary, each member must be unique. 