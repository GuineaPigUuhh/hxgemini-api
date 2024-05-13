package hxgemini_api.types;

typedef Tool =
{
	functionDeclarations:Array<FunctionDeclarations>
}

typedef FunctionDeclarations =
{
	name:String,
	description:String,
	parameters:Dynamic
}
