package hxgemini_api.types;

typedef ContentArgs =
{
	var contents:Dynamic;
	@:optional var safety_settings:Array<SafetySetting>;
	@:optional var generation_config:GenerationConfig;
	@:optional var stream:Bool;
}
