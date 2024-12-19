package hxgemini_api.requests;

import haxe.Exception;

class BaseRequest 
{ 
    public function getOperation():String return '';
    public function getMethod():String return 'GET';
    public function getData():String return null;

    public function onStatus(status:Int):Void {}
    public function onError(msg:String):Void throw new Exception(msg);
}