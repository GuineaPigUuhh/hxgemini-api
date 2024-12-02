package hxgemini_api.requests;

class ModelsRequest implements IRequest 
{
    public function new() {}
    public function getOperation():String   return 'models';
    public function getMethod():String  return 'GET';
    public function getData():String  return null;
    public function getPayload():String return '';
}