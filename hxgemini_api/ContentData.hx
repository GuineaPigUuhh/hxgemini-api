package hxgemini_api;

import hxgemini_api.parts.IPart;

abstract ContentData(Dynamic)
{
    inline public function new(Rule:String = 'user', ...Parts:IPart) modify(Rule, ...Parts);
    inline public function modify(Rule:String = 'user', ...Parts:IPart) this = {"parts": Parts.toArray().map(p->p.data), "role": Rule};
}