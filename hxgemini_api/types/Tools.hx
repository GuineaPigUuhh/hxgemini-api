package hxgemini_api.types;

typedef Tool =
{
	function_declarations:Array<FunctionDeclarations>
}

typedef FunctionDeclarations =
{
	name:String,
	description:String,
	parameters:Dynamic,
	required:Array<String>
}
