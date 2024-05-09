package hxgemini_api;

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
	private var tools:Array<Dynamic> = null;

	private var history:Array<Dynamic> = null;

	public function new(Model:String = 'gemini-pro', ?Args:ModelArgs)
	{
		if (GenerativeAI.GOOGLE_API_KEY == null)
			throw new Exception("To use AI you have to have the key!");
		configure_model(Model, Args);
	}

	private function get_rest(?stream = false)
	{
		var contentType = stream ? 'streamGenerateContent' : 'generateContent';
		var vmodels = 'v1beta/models/';
		return Path.join([vmodels, '$model:$contentType?key=${GenerativeAI.GOOGLE_API_KEY}']);
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
	 * @param contents content you will send.
	 * @return Dynamic
	 */
	public function send_message(Args:ContentArgs):Dynamic
	{
		if (history == null)
			throw new Exception("You didn't start a chat!");

		history_new("user", [{"text": Args.contents}]);
		var response:Dynamic = generate_content(Args);
		history_new("model", [{"text": response.text}]);

		return response;
	}

	/**
	 * make AI generate content
	 * @param contents content that you will send the AI to generate.
	 * @return Dynamic
	 */
	public function generate_content(Args:ContentArgs):Dynamic
	{
		var response:Dynamic = GenerativeAI.request(get_rest(Args.stream ?? false), true, {
			"contents": parse_contents(Args.contents),
			"safetySettings": Args.safety_settings ?? safety_settings,
			"generationConfig": Args.generation_config ?? generation_config
		});
		response.text = response.candidates[0].content.parts[0].text;

		return response;
	}

	private function configure_model(Model:String, ?Args:ModelArgs)
	{
		var model_data = Args ?? {};
		this.model = Model;
		this.safety_settings = model_data.safety_settings ?? Help.dummy_safety_settings();
		this.generation_config = model_data.generation_config ?? Help.dummy_generation_config();
	}

	private function parse_contents(contents:Dynamic)
	{
		var newContents:Dynamic;
		try
		{
			newContents = cast(contents, Array<Dynamic>);
		}
		catch (e)
		{
			newContents = [
				{
					"role": "user",
					"parts": [
						{
							"text": contents
						}
					]
				}
			];
		}
		return newContents;
	}

	private function history_new(role:String, parts:Array<Dynamic>)
	{
		history.push({
			"role": role,
			"parts": parts
		});
	}
}
