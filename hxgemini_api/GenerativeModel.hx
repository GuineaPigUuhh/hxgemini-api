package hxgemini_api;

import hxgemini_api.types.Tools.Tool;
import hxgemini_api.types.ToolConfig;
import hxgemini_api.GenerativeAI;
import hxgemini_api.types.ModelArgs;
import hxgemini_api.types.ContentArgs;
import hxgemini_api.types.SafetySetting;
import hxgemini_api.types.GenerationConfig;
import hxgemini_api.utils.Dummies;
import haxe.Exception;
import haxe.io.Path;

class GenerativeModel
{
	var model:String = null;
	var safety_settings:Array<SafetySetting> = null;
	var generation_config:GenerationConfig = null;
	var tools:Array<Tool> = null;
	var tool_config:ToolConfig = null;
	var system_instruction:String = null;

	var Key:String = null;

	public function new(Key:String, ?Model:String = 'gemini-pro', ?Args:ModelArgs)
	{
		var model_args = Args ?? {};

		this.Key = Key;
		this.model = Model;

		this.safety_settings = model_args.safety_settings ?? Dummies.safety_settings;
		this.generation_config = model_args.generation_config ?? Dummies.generation_config;
		this.tools = model_args.tools ?? [];
		this.tool_config = model_args.tool_config ?? {};
		this.system_instruction = model_args.system_instruction;
	}

	/**
	 * Start a chat with the AI.
	 * @param history is your conversation history.
	 * @return new ChatSession
	 */
	public function start_chat(history:Array<Dynamic>)
	{
		return new ChatSession(this, history);
	}

	/**
	 * make AI generate content
	 * @param Contents content that you will send the AI to generate.
	 * @param Args are the extra parameters for more specific things.
	 * @return Dynamic
	 */
	public function generate_content(Contents:Dynamic, ?Args:ContentArgs):Dynamic
	{
		Args = Args ?? {};
		var data:Dynamic = {
			contents: parse_contents(Contents),
			safetySettings: Args.safety_settings ?? safety_settings,
			tools: Args.tools ?? tools,
			tool_config: Args.tool_config ?? tool_config,
			generationConfig: Args.generation_config ?? generation_config
		};
		if (Args.system_instruction != null || system_instruction != null)
			data.system_instruction = {
				"parts": {"text": Args.system_instruction ?? system_instruction}
			};
		var response = GenerativeAI.request(get_rest(Args.stream), true, data);
		response.text = response.candidates[0].content.parts[0]?.text;
		return response;
	}

	// * Functions that are just utilities

	private function parse_contents(Contents:Dynamic):Array<Dynamic>
	{
		try
		{
			return cast(Contents, Array<Dynamic>);
		}
		catch (e)
			return [
				{
					"parts": [
						{
							"text": Contents
						}
					]
				}
			];
	}

	private function get_rest(?stream = false)
	{
		var type = stream ? 'streamGenerateContent' : 'generateContent';
		var models = 'v1beta/models/';
		return Path.join([models, '$model:$type?key=${Key}']);
	}
}
