package wx;

import wx.Window;

class CheckBox extends Control
{
	public var checked(get,set):Bool;
	public var onCheck(null,set) : Dynamic->Void;

   public static function create(inParent:Window, ?inID:Null<Int>, inLabel:String="",
	                ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
		var arr:Array<Dynamic> = [inParent.wxHandle, inID, inLabel, inPosition, inSize, inStyle];
      var handle = wx_checkbox_create(arr);
      return new CheckBox(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

	function set_onCheck(f:Dynamic->Void) {setHandler(wx.EventID.COMMAND_CHECKBOX_CLICKED,f); return f;}

	private function set_checked(inVal:Bool) : Bool
	{
		wx_checkbox_set_checked(wxHandle,inVal);
		return inVal;
	}
	private function get_checked() : Bool
	{
		return wx_checkbox_get_checked(wxHandle);
	}

   static var wx_checkbox_create = Loader.load("wx_checkbox_create",1);
   static var wx_checkbox_get_checked = Loader.load("wx_checkbox_get_checked",1);
   static var wx_checkbox_set_checked = Loader.load("wx_checkbox_set_checked",2);



   public function setValue(trueFalse:Bool)  { wx_checkbox_setValue(wxHandle,trueFalse); }
   static var wx_checkbox_setValue = Loader.load("wx_checkbox_setValue",2);


}
