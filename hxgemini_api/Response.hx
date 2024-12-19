package hxgemini_api;

import haxe.io.BytesOutput;
import haxe.io.Bytes;

class Response 
{
    public var data(get, never):String;
    public var bytes:Bytes = null;
    public var output:BytesOutput = null;

    public function new(output:BytesOutput)
    {
        this.output = output;
        bytes = output.getBytes();
    }

    function get_data():String
        return bytes != null ? bytes.toString() : null;
}