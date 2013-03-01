package wx;

import wx.Window;

class Button extends Control
{
	public var onClick(null,set) : Dynamic->Void;

   public static function create(inParent:Window, ?inID:Null<Int>, inLabel:String="",
	                ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
	  var arr:Array<Dynamic> = [inParent.wxHandle, inID, inLabel, inPosition, inSize, inStyle];
      var handle = wx_button_create(arr);
      return new Button(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

	function set_onClick(f:Dynamic->Void) {setHandler(wx.EventID.COMMAND_BUTTON_CLICKED,f); return f;}

   static var wx_button_create = Loader.load("wx_button_create",1);
}
