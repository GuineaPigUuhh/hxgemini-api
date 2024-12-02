package hxgemini_api.parts;

interface IPart
{
    public var str:Null<String>;
    public var data(get, null):Dynamic;
    public function stringify():String;
}