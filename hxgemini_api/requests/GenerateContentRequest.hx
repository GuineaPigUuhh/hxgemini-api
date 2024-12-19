package hxgemini_api.requests;

import haxe.Exception;

class GenerateContentRequest extends BaseRequest
{
    var model:String;
    var data:Dynamic;
    var stream:Bool = false;

    public function new(Model:String, Stream:Bool, Data:Dynamic)
    {
        model = Model;
        stream = Stream;
        data = Data;
    }
    
    public override function getOperation():String   return 'models/$model:${stream ? 'streamGenerateContent' : 'generateContent'}';
    public override function getMethod():String  return 'POST';
    public override function getData():String  return data;
}