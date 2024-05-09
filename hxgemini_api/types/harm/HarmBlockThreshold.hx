package hxgemini_api.types.harm;

enum abstract HarmBlockThreshold(String)
{
	public var HARM_BLOCK_THRESHOLD_UNSPECIFIED = 'HARM_BLOCK_THRESHOLD_UNSPECIFIED';
	public var BLOCK_LOW_AND_ABOVE = 'BLOCK_LOW_AND_ABOVE';
	public var BLOCK_MEDIUM_AND_ABOVE = 'BLOCK_MEDIUM_AND_ABOVE';
	public var BLOCK_ONLY_HIGH = 'BLOCK_ONLY_HIGH';
	public var BLOCK_NONE = 'BLOCK_NONE';
}
