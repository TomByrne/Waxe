package wx;

import wx.Window;

class ToolTip extends Control
{
   public static function create(tip:String, ?window:Window)
   {
      var handle = wx_tool_tip_create(tip);
      var ret = new ToolTip(handle);
	  if (window != null) {
		  window.setToolTip(ret);
	  }
	  return ret;
   }
   static var wx_tool_tip_create = Loader.load("wx_tool_tip_create",1);


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

   public var tip(get_tip, set_tip):String;
   private function get_tip():String return wx_tool_tip_get_tip(wxHandle)
   private function set_tip(value:String):String{
   		wx_tool_tip_set_tip(wxHandle, value);
   		return value;
   }

   static var wx_tool_tip_get_tip = Loader.load("wx_tool_tip_get_tip",1);
   static var wx_tool_tip_set_tip = Loader.load("wx_tool_tip_set_tip",2);


}
