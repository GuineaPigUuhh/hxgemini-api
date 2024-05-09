# hxgemini-api

Haxe functions to use the [Gemini IA Integration](https://gemini.google.com/app).

> [!WARNING]
> **This is not an official Google Library!** so don't expect constant updates.

## Usage Exemple
```haxe
import hxgemini_api.GenerativeAI as GenAI;
import hxgemini_api.GenerativeModel as Model;

GenAi.configure('key-here');

var model = new Model('gemini-pro');
var response = model.generate_message({contents: 'What is the meaning of life?'});
trace(response.text);
```

## Contribute to the API!
> [!NOTE]
> If you want to add something new to the AP, **make a Pull Request!**