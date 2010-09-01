package wx.clay;

class Toolbox extends wx.Window
{
   public static var LABEL_NONE = 0;
   public static var LABEL_RIGHT = 1;
   public static var LABEL_BOTTOM = 2;


   public function new(inParent:wx.Window,
                    inName:String="Toolbar",
                    inLabelPos:Int=0,
                    inRadioPreview:Bool = true,
                    ?inSkin:ToolboxSkin )
   {
      super(  wx_toolbox_create(inParent==null?null:inParent.wxHandle,
                    inName, inLabelPos,inRadioPreview,inSkin) );
   }

   public function addControl(inControl:wx.Window) : Void
   {
      wx_toolbox_add_control(wxHandle,inControl.wxHandle);
   }

   public function addSeparator()
   {
      return wx_toolbox_add_separator(wxHandle);
   }


   static var wx_toolbox_create = neko.Lib.load("waxe","wx_toolbox_create",5);
   static var wx_toolbox_add_control = neko.Lib.load("waxe","wx_toolbox_add_control",2);
   static var wx_toolbox_add_separator = neko.Lib.load("waxe","wx_toolbox_add_separator",1);

}
