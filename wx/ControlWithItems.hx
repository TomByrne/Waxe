package wx;

import wx.Window;

class ControlWithItems extends Control
{
	function new(inHandle:Dynamic) { super(inHandle); }

	public function clear()  { wx_controlWithItems_clear(wxHandle); }
	static var wx_controlWithItems_clear = Loader.load("wx_controlWithItems_clear",1);

	public function insert(insertString:String,position:Int):Int  { return wx_wxControlWithItems_insert(wxHandle,insertString,position); }
	static var wx_wxControlWithItems_insert = Loader.load("wx_wxControlWithItems_insert",3);

	public function append(insertString:String):Int  { return wx_wxControlWithItems_append(wxHandle,insertString); }
	static var wx_wxControlWithItems_append = Loader.load("wx_wxControlWithItems_append",2);

	public function delete(position:Int)  { wx_wxControlWithItems_delete(wxHandle,position); }
	static var wx_wxControlWithItems_delete = Loader.load("wx_wxControlWithItems_delete",2);

	/*
	public function findString(stringToFind:String,caseSensitive:Bool):Dynamic { wx_wxControlWithItems_FindString(wxHandle,stringToFind,caseSensitive); }
	static var wx_wxControlWithItems_FindString = Loader.load("wx_wxControlWithItems_FindString",3);
	*/
	
	
   public function getSelection() : Int { return wx_wxControlWithItems_get_selection(wxHandle); }
   public function setSelection(val:Int) : Int
   {
      wx_wxControlWithItems_set_selection(wxHandle,val);
      return val;
   }
   static var wx_wxControlWithItems_get_selection = Loader.load("wx_wxControlWithItems_get_selection",1);
   static var wx_wxControlWithItems_set_selection = Loader.load("wx_wxControlWithItems_set_selection",2);

   public function getString(inI:Int) : String
   {
      return wx_wxControlWithItems_get_string(wxHandle,inI);
   }
   public function setString(inI:Int,inString:String)
   {
      wx_wxControlWithItems_set_string(wxHandle,inString,inI);
   }
   static var wx_wxControlWithItems_get_string = Loader.load("wx_wxControlWithItems_get_string",2);
   static var wx_wxControlWithItems_set_string = Loader.load("wx_wxControlWithItems_set_string",3);
}
