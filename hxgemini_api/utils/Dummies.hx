package hxgemini_api.utils;

import hxgemini_api.types.ToolConfig;
import hxgemini_api.types.Tools.Tool;
import hxgemini_api.types.SafetySetting;
import hxgemini_api.types.GenerationConfig;

class Dummies
{
	public static final safety_settings:Array<SafetySetting> = [
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

	public static final generation_config:GenerationConfig = {
		stopSequences: [],
		maxOutputTokens: 800,
		temperature: 1.0,
		topP: 0.8,
		topK: 10
	};

	public static final tools:Array<Tool> = [];
	public static final tools_config:ToolConfig = {};
	public static final system_instruction:Dynamic = null;
}
