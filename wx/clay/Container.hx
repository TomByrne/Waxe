package wx.clay;

class Container
{
   public var parent(wxGetParent,null) : Container;
   public var manager(wxGetManager,null) : Manager;
   public var shown(wxGetShow,wxSetShow) : Bool;
   public var rect(wxGetRect,wxSetRect) : wx.Rect;
   public var window(wxGetWindow,wxSetWindow) : wx.Window;

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
   public function addToolBox(inToolBox:ToolBox, inWhere:AddPosition )
   {
   }


}



