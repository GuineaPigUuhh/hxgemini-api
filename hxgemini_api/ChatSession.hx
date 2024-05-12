package hxgemini_api;

import haxe.Exception;
import hxgemini_api.types.ContentArgs;

class ChatSession
{
	var history:Array<Dynamic> = null;
	var parent:GenerativeModel;

	/**
	 * @param parent
	 * @param history is your conversation history.
	 */
	public function new(parent:GenerativeModel, history:Array<Dynamic>)
	{
		this.parent = parent;
		this.history = history;
	}

	/**
	 * send a message to AI. 
	 * @param Contents content you will send.
	 * @param Args are the extra parameters for more specific things.
	 * @return Dynamic
	 */
	public function send_message(Contents:Dynamic, ?Args:ContentArgs):Dynamic
	{
		if (history == null)
			throw new Exception("You didn't start a chat!");
		Args = Args ?? {};

		history_new("user", [{"text": Contents}]);
		var response:Dynamic = parent.generate_content(Contents, Args);
		history_new("model", [{"text": response.text}]);

		return response;
	}

	private function history_new(role:String, parts:Array<Dynamic>)
	{
		history.push({
			"role": role,
			"parts": parts
		});
	}
}
