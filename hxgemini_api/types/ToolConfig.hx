package hxgemini_api.types;

typedef ToolConfig =
{
	?function_calling_config:FuncCallingConfig
}

typedef FuncCallingConfig =
{
	?mode:String,
	?allowed_function_names:Array<String>
}
