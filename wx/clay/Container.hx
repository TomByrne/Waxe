package wx.clay;

class Container
{
   public var parent(wxGetParent,null) : Container;
   public var manager(wxGetManager,null) : Manager;
   public var shown(wxGetShown,wxSetShown) : Bool;
   public var rect(wxGetRect,wxSetRect) : wx.Rect;
   public var window(wxGetWindow,null) : wx.Window;

   public var wxHandle:Dynamic;
   
   public function raise()
   {
   }

   public function addContainer(inContainer:Container, inWhere:AddPosition)
   {
   }

   public function addWindow(inWindow:wx.Window, inWhere:AddPosition, /* Icons */
                     inFlags:Int = 0, inAsToolbar:Bool = false )
   {
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


}



