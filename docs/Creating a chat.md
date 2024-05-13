# Creating a chat
With a model, add this function to a variable:
```haxe
var chat = model.start_chat([]);
```
Sending a message:
```haxe
var response = chat.send_message('Hi!');
trace(response.candidates[0].content.parts[0].text);
```