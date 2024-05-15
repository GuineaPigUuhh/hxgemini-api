package hxgemini_api;

import hxgemini_api.types.ModelArgs;
import haxe.Http;
import haxe.Json;
import haxe.io.Path;

using StringTools;

class GenerativeAI
{
	public static final apiUrl = "https://generativelanguage.googleapis.com";

	/**
	 * for the Library to work you have to have the AI Key!
	 * @see https://aistudio.google.com/app/apikey
	 */
	public static var API_KEY:String = null;

	/**
	 * is used to configure the Library.
	 * @param Key is the API Key, you need this Key to use the AI
	 */
	public static function configure(Key:String)
	{
		API_KEY = Key;
	}

	/**
	 * @param Model_Name Name of the Model you are going to use
	 * @param Model_Args are extra parameters for more specific things.
	 * @return new GenerativeModel
	 */
	public static function model(Model_Name = "gemini-pro", ?Model_Args:ModelArgs)
	{
		return new GenerativeModel(API_KEY, Model_Name, Model_Args);
	}

	/**
	 * List of possible models.
	 * @return Array<Dynamic>
	 */
	public static function list_models():Array<Dynamic>
	{
		var urlr = request('v1beta/models?key=$API_KEY');
		return urlr.models;
	}

	public static function request(url:String, post:Bool = false, data:Null<Any> = null):Dynamic
	{
		var api = new Http(Path.join([apiUrl, url]));
		api.setHeader("Content-Type", "application/json");
		if (data != null)
			api.setPostData(Json.stringify(data));
		api.request(post);

		try
		{
			return Json.parse(api.responseData);
		}
		catch (e)
			return api.responseData;
	}
}
