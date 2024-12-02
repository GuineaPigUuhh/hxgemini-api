package hxgemini_api.requests;

class GenerateContentRequest implements IRequest
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
    
    public function getOperation():String   return '/models/$model:${stream ? 'streamGenerateContent' : 'generateContent'}';
    public function getMethod():String  return 'POST';
    public function getData():String  return data;
    public function getPayload():String return '';
}