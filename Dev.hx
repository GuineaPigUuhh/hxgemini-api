import hxgemini_api.GenerativeAI as GenAI;

class Dev
{
	static function main()
	{
		GenAI.configure('AIzaSyCyLjt81bm30SUeO-NI6ttgP_zLCmz4VY4');

		var model = GenAI.model('gemini-pro');
		var response = model.generate_content('What is the meaning of life?');
		trace(response.text);
	}
}
