package hxgemini_api.requests;

interface IRequest 
{ 
    public function getOperation():String;
    public function getMethod():String;
    public function getData():String;
    public function getPayload():String;
}