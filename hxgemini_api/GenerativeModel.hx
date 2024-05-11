package hxgemini_api;

import haxe.Json;
import hxgemini_api.GenerativeAI;
import hxgemini_api.types.ModelArgs;
import hxgemini_api.types.ContentArgs;
import hxgemini_api.types.SafetySetting;
import hxgemini_api.types.GenerationConfig;
import hxgemini_api.utils.Help;
import haxe.Exception;
import haxe.io.Path;

class GenerativeModel
{
	private var model:String = null;
	private var safety_settings:Array<SafetySetting> = null;
	private var generation_config:GenerationConfig = null;

	private var history:Array<Dynamic> = null;

	private var Key:String = null;

	public function new(Key:String, ?Model:String = 'gemini-pro', ?Args:ModelArgs)
	{
		var model_args = Args ?? {};

		// * Model config
		this.Key = Key;
		this.model = Model;

		// ? Extra params
		this.safety_settings = model_args.safety_settings ?? Help.dummy_safety_settings();
		this.generation_config = model_args.generation_config ?? Help.dummy_generation_config();
	}

	/**
	 * Start a chat with the AI.
	 * @param history is your conversation history.
	 */
	public function start_chat(?history:Array<Dynamic>)
	{
		this.history = history ?? [];
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
		var response:Dynamic = generate_content(Contents, Args);
		history_new("model", [{"text": response.text}]);

		return response;
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
		var response:Dynamic = GenerativeAI.request(get_rest(Args.stream), true, {
			"contents": parse_contents(Contents),
			"safetySettings": Args.safety_settings ?? safety_settings,
			"generationConfig": Args.generation_config ?? generation_config
		});
		response.text = response.candidates[0].content.parts[0].text;

		return response;
	}

	// * Functions that are just utilities

	private function parse_contents(Contents:Dynamic):Dynamic
	{
		try
		{
			return cast(Contents, Array<Dynamic>);
		}
		catch (e)
			return [
				{
					"role": "user",
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

	private function history_new(role:String, parts:Array<Dynamic>)
	{
		history.push({
			"role": role,
			"parts": parts
		});
	}
}
