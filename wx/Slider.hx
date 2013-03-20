package wx;

import wx.Window;

class Slider extends Control
{
   public static function create(inParent:Window, ?inID:Null<Int>, value:Int=0, minValue:Int=0, maxValue:Int=100,
	                ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
	  var arr:Dynamic = [inParent.wxHandle,inID,value,minValue,maxValue,inPosition,inSize, inStyle];
      var handle = wx_slider_create(arr);
      return new Slider(handle);
   }
   static var wx_slider_create = Loader.load("wx_slider_create", 1);


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }
   
   public var value(get, set):Int;
   private function get_value():Int
   {
      return wx_slider_get_value(wxHandle);
   }
   private function set_value(value:Int):Int
   {
	   wx_slider_set_value(wxHandle, value);
      return value;
   }
   static var wx_slider_get_value = Loader.load("wx_slider_get_value",1);
   static var wx_slider_set_value = Loader.load("wx_slider_set_value", 2);
   
   
   public var min(get, null):Int;
   private function get_min():Int
   {
      return wx_slider_get_min(wxHandle);
   }
   static var wx_slider_get_min = Loader.load("wx_slider_get_min",1);
   
   
   public var max(get_max, null):Int;
   private function get_max():Int
   {
      return wx_slider_get_max(wxHandle);
   }
   static var wx_slider_get_max = Loader.load("wx_slider_get_max", 1);
   
   
   public function setRange(minValue:Int, maxValue:Int):Void
   {
      wx_slider_set_range(wxHandle, minValue, maxValue);
   }
   static var wx_slider_set_range = Loader.load("wx_slider_set_range",3);
}
