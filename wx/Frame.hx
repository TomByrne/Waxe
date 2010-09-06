package wx;

class Frame extends TopLevelWindow
{
   public var menuBar(null,wxSetMenuBar) : wx.MenuBar;

   public static function create(inParent:Window, ?inID:Int, inTitle:String="",
						?inPosition:{x:Float,y:Float},
                   ?inSize:{w:Float,h:Float}, ?inStyle:Int )
   {
      var handle = wx_frame_create(
			[inParent==null ? null : inParent.wxHandle,inID,inTitle,inPosition,inSize, inStyle] );
      return new Frame(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

   public function wxSetMenuBar(inBar:wx.MenuBar)
   {
      wx_frame_set_menu_bar(wxHandle,inBar);
      return inBar;
   }

   static var wx_frame_create = neko.Lib.load("waxe","wx_frame_create",1);
   static var wx_frame_set_menu_bar = neko.Lib.load("waxe","wx_frame_set_menu_bar",2);

}
