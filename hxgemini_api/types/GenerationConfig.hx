package hxgemini_api.types;

typedef GenerationConfig =
{
	stopSequences:Array<String>,
	?candidateCount:Int,
	?response_mime_type:String,
	maxOutputTokens:Int,
	temperature:Float,
	topP:Float,
	topK:Int
}
