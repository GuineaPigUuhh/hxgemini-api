import hxgemini_api.parts.TextPart;
import hxgemini_api.GenerativeAI as GenAI;

class Code
{
	static function main()
	{
		GenAI.configure('key-here');

		var model = GenAI.model('gemini-1.5-flash');
		final response = model.generate_content(new TextPart('Hi!'));
		Sys.println(response?.text);
	}
}
