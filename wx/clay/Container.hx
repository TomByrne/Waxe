package wx.clay;

class Container
{
   public var parent(wxGetParent,null) : Container;
   public var manager(wxGetManager,null) : Manager;
   public var shown(wxGetShown,wxSetShown) : Bool;
   public var rect(wxGetRect,wxSetRect) : wx.Rect;
   public var window(wxGetWindow,null) : wx.Window;

   public var wxHandle:Dynamic;
   function _wx_deleted() { wxHandle=null; }

   
   function new() {}

   public function raise()
   {
   }

   public function addContainer(inContainer:Container, inWhere:AddPosition)
   {
   }

   public function addWindow(inWindow:wx.Window, inWhere:AddPosition, /* Icons */
                     inFlags:Int = 0, inAsToolbar:Bool = false ) : Container
   {
       var container = new Container();
       container.wxHandle = wx_container_add_window(wxHandle, inWindow.wxHandle, container,
           Type.enumIndex(inWhere), inFlags, inAsToolbar );
       return container;
   }
   public function addToolbox(inToolbox:Toolbox, inWhere:AddPosition )
   {
   }

   public function wxGetParent() : Container { return null; }
   public function wxGetManager() : Manager { return null; }

   public function wxGetShown() : Bool { return false; }
   public function wxSetShown(inShow:Bool) : Bool { return false; }

   public function wxGetRect() : wx.Rect { return null; }
   public function wxSetRect(inRect:wx.Rect) : wx.Rect { return null; }

   public function wxGetWindow() : wx.Window { return null; }


   public static function wxCreate() { return new Container(); }


    static var wx_container_add_window = neko.Lib.load("waxe","wx_container_add_window",-1);
}



