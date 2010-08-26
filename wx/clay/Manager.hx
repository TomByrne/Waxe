package wx.clay;

class Manager
{
   public var root(wxGetRoot,null):Container;

   var mHandle:Dynamic;
   function _wx_deleted() { mHandle=null; }


   public function new(inFrame:wx.Frame)
   {
      mHandle = wx_clay_man_create(inFrame.wxHandle,this);
      var root = Container.wxCreate();
      root.wxHandle = wx_clay_man_init_root_container(mHandle,root);
   }

   function wxGetRoot():Container
   {
      return wx_clay_man_get_root(mHandle);
   }


   static var wx_clay_man_create = neko.Lib.load("waxe","wx_clay_man_create",2);
   static var wx_clay_man_get_root = neko.Lib.load("waxe","wx_clay_man_get_root",1);
   static var wx_clay_man_init_root_container = neko.Lib.load("waxe","wx_clay_man_init_root_container",2);
}
