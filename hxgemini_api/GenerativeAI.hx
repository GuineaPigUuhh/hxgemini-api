package hxgemini_api;

import hxgemini_api.requests.ModelsRequest;
import hxgemini_api.Response;
import hxgemini_api.requests.BaseRequest;
import hxgemini_api.types.APIVersion;
import hxgemini_api.types.ModelArgs;
import haxe.Http;
import haxe.Json;
import haxe.io.Path;
import haxe.io.BytesOutput;

using StringTools;

class GenerativeAI
{
	public static final apiUrl = "https://generativelanguage.googleapis.com";
	
	/**
	 * for the Library to work you have to have the AI Key!
	 * @see https://aistudio.google.com/app/apikey
	 */
	 public static var API_KEY:String = null;
	 public static var API_VERSION:APIVersion = API_VERSION_1_BETA;

	/**
	 * is used to configure the Library.
	 * @param Key is the API Key, you need this Key to use the AI
	 */
	public static function configure(Key:String)
	{
		API_KEY = Key;
	}

	/**
	 * @param Name Name of the Model you are going to use
	 * @param Args are extra parameters for more specific things.
	 * @return new GenerativeModel
	 */
	public static function model(Name = "gemini-pro", ?Args:ModelArgs)
	{
		return new GenerativeModel(API_KEY, Name, Args);
	}

	/**
	 * List of possible models.
	 * @return Array<Dynamic>
	 */
	public static function list_models():Array<Dynamic>
	{
		var request = new ModelsRequest();
		var response = do_request(request);
		return Json.parse(response.data).models;
	}

	public static function do_request(Request:BaseRequest):Response
	{
		var response = new Http(formatURL(Request));
		response.setHeader("content-type", "application/json");
		response.setHeader("x-goog-api-key", API_KEY);

		if (Request.getData() != null) 
			response.setPostData(Json.stringify(Request.getData()));

		var output = new BytesOutput();

		response.onStatus = Request.onStatus;
		response.onError = Request.onError;

		response.customRequest(Request.getMethod() == 'POST', output, null, Request.getMethod());

		return new Response(output);
	}

	public static function formatURL(Request:BaseRequest) 
	{
		return Path.join([apiUrl, API_VERSION, Request.getOperation()]);
	}
}
