import hxgemini_api.GenerativeAI as GenAI;

class Code
{
	static function main()
	{
		GenAI.configure('key-here');

		var model = GenAI.model('gemini-1.5-pro-latest', {});
		final response = model.generate_content('Hi!');
		final responsetxt = response.candidates[0].content.parts[0].text;

		trace(responsetxt);
	}
}
