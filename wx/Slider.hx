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
      var handle = wx_slider_create(
			[inParent.wxHandle,inID,value,minValue,maxValue,inPosition,inSize, inStyle] );
      return new Slider(handle);
   }
   static var wx_slider_create = Loader.load("wx_slider_create",1);


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }
}
