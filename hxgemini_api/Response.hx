package hxgemini_api.responses;

import haxe.io.BytesOutput;
import haxe.io.Bytes;

class Response 
{
    public var data(get, never):String;
    public var bytes:Bytes = null;

    public function new(output:BytesOutput)
        bytes = output.getBytes();

    function get_data():String
        return bytes != null ? bytes.toString() : null;
}