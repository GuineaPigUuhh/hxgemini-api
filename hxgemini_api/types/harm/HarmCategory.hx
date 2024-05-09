package hxgemini_api.types.harm;

enum abstract HarmCategory(String)
{
	public var HARM_CATEGORY_UNSPECIFIED = 'HARM_CATEGORY_UNSPECIFIED';
	public var HARM_CATEGORY_DEROGATORY = 'HARM_CATEGORY_DEROGATORY';
	public var HARM_CATEGORY_TOXICITY = 'HARM_CATEGORY_VIOLENCE';
	public var HARM_CATEGORY_SEXUAL = 'HARM_CATEGORY_SEXUAL';
	public var HARM_CATEGORY_MEDICAL = 'HARM_CATEGORY_MEDICAL';
	public var HARM_CATEGORY_DANGEROUS = 'HARM_CATEGORY_DANGEROUS';
	public var HARM_CATEGORY_HARASSMENT = 'HARM_CATEGORY_HARASSMENT';
	public var HARM_CATEGORY_HATE_SPEECH = 'HARM_CATEGORY_HATE_SPEECH';
	public var HARM_CATEGORY_SEXUALLY_EXPLICIT = 'HARM_CATEGORY_SEXUALLY_EXPLICIT';
	public var HARM_CATEGORY_DANGEROUS_CONTENT = 'HARM_CATEGORY_DANGEROUS_CONTENT';
}
