package hxgemini_api.parts;

import haxe.Json;
import hxgemini_api.parts.IPart;

class TextPart implements IPart
{
    public var str:Null<String> = null;
    public var data(get, null):Dynamic;

    public function new(Text:String) str = Text;
    private function get_data():Dynamic return {"text": str};
    public function stringify():String return Json.stringify(data);
}