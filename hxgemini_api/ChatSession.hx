package hxgemini_api;

import haxe.Exception;
import hxgemini_api.ContentData;
import hxgemini_api.parts.*;
import hxgemini_api.GenerativeModel;

class ChatSession
{
	var history:Array<ContentData> = null;
	var parent:GenerativeModel;

	/**
	 * @param parent
	 * @param history is your conversation history.
	 */
	public function new(Parent:GenerativeModel, History:Array<ContentData>)
	{
		this.parent = Parent;
		this.history = History;
	}

	/**
	 * send a message to AI. 
	 * @param Parts content that you will send the AI to generate.
	 * @return Dynamic
	 */
	public function send_message(...Parts:IPart):Dynamic
	{
		if (history == null)
			throw new Exception("You didn't start a chat!");

		history.push(new ContentData("user", ...Parts));

		@:privateAccess
		var response:Dynamic = parent.do_content_request(false,...history);

		history.push(new ContentData("model", new TextPart(response.text)));

		return response;
	}
}
