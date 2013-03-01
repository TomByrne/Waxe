package wx;

import wx.Window;

class Control extends Window
{
   // public var label(get,set):String;

   public function new(inHandle:Dynamic)
   {
      super(inHandle);
   }

   // private function set_label(inString:String) : String
   // {
   //    wx_control_set_label(wxHandle,inString);
   //    return inString;
   // }
   // private function get_label() : String
   // {
   //    return wx_control_get_label(wxHandle);
   // }

   // static var wx_control_get_label = Loader.load("wx_control_get_label",1);
   // static var wx_control_set_label = Loader.load("wx_control_set_label",2);
}
