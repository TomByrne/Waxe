package wx.clay;

class Manager
{
   var root(wxGetRoot,null):Container;

   var mHandle:Dynamic;


   public function new(inFrame:wx.Frame)
   {
      //mHandle = wx_clay_man_create(inFrame.wxHandle);
   }

	function wxGetRoot():Container
	{
	   return null;
	}


   //static var wx_clay_man_create = neko.Lib.load("waxe","wx_clay_man_create",1);

}
