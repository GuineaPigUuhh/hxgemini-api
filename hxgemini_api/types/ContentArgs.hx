package hxgemini_api.types;

typedef ContentArgs =
{
	?safety_settings:Array<SafetySetting>,
	?generation_config:GenerationConfig,
	?tools:Array<Dynamic>,
	?tool_config:ToolConfig,
	?system_instruction:String,
	?stream:Bool
}
