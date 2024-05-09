package hxgemini_api;

import haxe.Http;
import haxe.Json;
import haxe.io.Path;

class GenerativeAI
{
	public static final apiUrl = "https://generativelanguage.googleapis.com/";

	/**
	 * for the Library to work you have to have the AI Key!
	 * @see https://aistudio.google.com/app/apikey
	 */
	public static var GOOGLE_API_KEY:String = null;

	public static function configure(Key:String)
	{
		GOOGLE_API_KEY = Key;
	}

	public static function request(url:String, post:Bool = false, data:Null<Any> = null)
	{
		var api = new Http(Path.join([apiUrl, url]));
		api.setHeader("Content-Type", "application/json");
		if (data != null)
			api.setPostData(Json.stringify(data));
		api.request(post);

		return Json.parse(api.responseData);
	}
}
