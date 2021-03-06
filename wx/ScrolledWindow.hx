package wx;

import wx.Window;

class ScrolledWindow extends Panel
{
   public static function create(inParent:Window, ?inID:Null<Int>,
                   ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
      if (inParent==null)
         throw Error.INVALID_PARENT;
      var handle = wx_scrolled_window_create(
         [inParent.wxHandle,inID,"",inPosition,inSize, inStyle] );
      return new ScrolledWindow(handle);
   }

   static var wx_scrolled_window_create = Loader.load("wx_scrolled_window_create", 1);
   
   public function setScrollBars(pixelsPerUnitX:Int, pixelsPerUnitY:Int, noUnitsX:Int, noUnitsY:Int, xPos:Int = 0, yPos:Int = 0, noRefresh:Bool = false):Void {
	  wx_scrolled_window_set_scrollbars([wxHandle, pixelsPerUnitX, pixelsPerUnitY, noUnitsX, noUnitsY, xPos, yPos, noRefresh]);
   }
   static var wx_scrolled_window_set_scrollbars = Loader.load("wx_scrolled_window_set_scrollbars",1);
}

