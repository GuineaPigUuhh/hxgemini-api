package hxgemini_api;

import hxgemini_api.requests.GenerateContentRequest;
import haxe.Http;
import haxe.Json;
import haxe.Rest;
import hxgemini_api.types.Tools.Tool;
import hxgemini_api.types.ToolConfig;
import hxgemini_api.GenerativeAI;
import hxgemini_api.types.ModelArgs;
import hxgemini_api.types.SafetySetting;
import hxgemini_api.types.GenerationConfig;
import hxgemini_api.utils.Dummies;
import hxgemini_api.parts.*;
import haxe.Exception;

class GenerativeModel
{
	var safety_settings:Array<SafetySetting> = null;
	var generation_config:GenerationConfig = null;
	var tools:Array<Tool> = null;
	var tool_config:ToolConfig = null;
	var system_instruction:ContentData = null;
	
	var Model:String = null;
	var Key:String = null;

	public function new(Key:String, ?Model:String = 'gemini-pro', ?Args:ModelArgs)
	{
		this.Key = Key;
		this.Model = Model;
	}

	/**
	 * Start a chat with the AI.
	 * @param history is your conversation history.
	 * @return new ChatSession
	 */
	public function start_chat(history:Array<ContentData>)
	{
		return new ChatSession(this, history);
	}

	/**
	 * make AI generate content
	 * @param Parts content that you will send the AI to generate.
	 * @return Dynamic
	 */
	public function generate_content(...Parts:IPart):Dynamic
		return do_content_request(false,new ContentData('user',...Parts));

	private function do_content_request(Stream:Bool, ...Contents:ContentData):Dynamic
	{
		var Data:Dynamic = {
			safety_settings: safety_settings,
			tools: tools,
			tool_config: tool_config,
			generation_config: generation_config,
			system_instruction: system_instruction,
			contents: Contents.toArray()
		};

		var request = new GenerateContentRequest(Model, Stream, Data);
		var response = GenerativeAI.do_request(request);

		var json:Dynamic = Json.parse(response.data);
		//json.text = json?.candidates[0].content.parts[0].text;

		return json;
	}
}
