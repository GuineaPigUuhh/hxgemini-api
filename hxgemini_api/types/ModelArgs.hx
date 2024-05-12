package hxgemini_api.types;

import hxgemini_api.types.Tools.Tool;

typedef ModelArgs =
{
	?safety_settings:Array<SafetySetting>,
	?generation_config:GenerationConfig,
	?tools:Array<Tool>,
	?tool_config:ToolConfig,
	?system_instruction:String
}
