import hxgemini_api.GenerativeAI as GenAI;
import hxgemini_api.GenerativeModel as Model;

class Main
{
	static function main()
	{
		GenAI.configure('key-here');

		var model = new Model('gemini-pro');
		var response = model.generate_content({contents: 'Make a presentation about yourself'});
		trace(response.text);
	}
}
