package hxgemini_api.utils;

import hxgemini_api.backend.Types;

class Help
{
	public static var library_version(get, never):String;

	static function get_library_version()
		return '1.0.0';

	/**
	 * List of possible models.
	 * @param only_that_generate_content make it list only the models that generate content.
	 * @return possible models
	 */
	public static function list_models(only_that_generate_content = false):Array<String>
	{
		return only_that_generate_content ? [
			"gemini-1.0-pro",
			"gemini-1.0-pro-001",
			"gemini-1.0-pro-latest",
			"gemini-1.0-pro-vision-latest",
			"gemini-1.5-pro-latest",
			"gemini-pro",
			"gemini-pro-vision"
		] : [
			"chat-bison-001",
			"text-bison-001",
			"embedding-gecko-001",
			"gemini-1.0-pro",
			"gemini-1.0-pro-001",
			"gemini-1.0-pro-latest",
			"gemini-1.0-pro-vision-latest",
			"gemini-1.5-pro-latest",
			"gemini-pro",
			"gemini-pro-vision",
			"embedding-001",
			"text-embedding-004",
			"aqa"
			];
	}

	public static function dummy_safety_settings():Array<SafetySetting>
	{
		return [
			{
				"category": HARM_CATEGORY_SEXUALLY_EXPLICIT,
				"threshold": BLOCK_ONLY_HIGH
			},
			{
				"category": HARM_CATEGORY_HATE_SPEECH,
				"threshold": BLOCK_ONLY_HIGH
			},
			{
				"category": HARM_CATEGORY_HARASSMENT,
				"threshold": BLOCK_ONLY_HIGH
			},
			{
				"category": HARM_CATEGORY_DANGEROUS_CONTENT,
				"threshold": BLOCK_ONLY_HIGH
			}
		];
	}

	public static function dummy_generation_config():GenerationConfig
	{
		return {
			stopSequences: [],
			maxOutputTokens: 800,
			temperature: 1.0,
			topP: 0.8,
			topK: 10
		};
	}
}
