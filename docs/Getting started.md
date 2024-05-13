# Getting started
Import the main library:
```haxe
import hxgemini_api.GenerativeAI as GenAI;
```
Configuring the library:
```haxe
GenAI.configure('key-here');
```
Creating a model:
```haxe
var model = GenAI.model('Model Name');

var response = model.generate_content('Hi!');
trace(response.candidates[0].content.parts[0].text);
```
To list the models, run this command:
```haxe
/*
    Recommended models:
        gemini-pro
        gemini-1.0-pro
        gemini-1.0-pro-latest
        gemini-1.5-pro-latest
*/

for (i in GenAI.list_models())
	if (i.supportedGenerationMethods.contains('generateContent'))
		trace(i.name);
```

> [!TIP]
>  **Recommended models:**
> - gemini-pro
> - gemini-1.0-pro
> - gemini-1.0-pro-latest
> - gemini-1.5-pro-latest