import hxgemini_api.GenerativeAI as GenAI;
import hxgemini_api.GenerativeModel as Model;

class Main
{
	static function main()
	{
		GenIA.configure('key-here');

		var model = new Model('gemini-pro');
		var response = model.generate_content('Make a presentation about yourself');
		trace(response.text);
	}
}
