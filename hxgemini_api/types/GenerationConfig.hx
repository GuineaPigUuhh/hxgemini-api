package hxgemini_api.types;

typedef GenerationConfig =
{
	var stopSequences:Array<String>;
	@:optional var candidateCount:Int;
	var maxOutputTokens:Int;
	var temperature:Float;
	var topP:Float;
	var topK:Int;
}
