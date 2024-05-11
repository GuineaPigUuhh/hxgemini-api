# hxgemini-api

Haxe functions to use the [Gemini IA Integration](https://gemini.google.com/app).

> [!WARNING]
> **This is not an official Google Library**, there is still a lot missing from the API. This Library will not be updated frequently!

## Installation
```bash
haxelib git hxgemini-api https://github.com/GuineaPigUuhh/hxgemini-api.git
```

## Usage Exemple
```haxe
import hxgemini_api.GenerativeAI as GenAI;

GenAI.configure('key-here');

var model = GenAI.model('gemini-pro');
var response = model.generate_content('What is the meaning of life?');
trace(response.text);
```

## Contribute to the API!
> [!NOTE]
> If you want to add something new to the API, **make a Pull Request!**