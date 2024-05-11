package hxgemini_api.types;

typedef ModelArgs =
{
	@:optional var safety_settings:Array<SafetySetting>;
	@:optional var generation_config:GenerationConfig;
	@:optional var tools:Array<Dynamic>;
}
