package hxgemini_api.types;

typedef ContentArgs =
{
	@:optional var safety_settings:Array<SafetySetting>;
	@:optional var generation_config:GenerationConfig;
	@:optional var tools:Array<Dynamic>;
	@:optional var stream:Bool;
}
