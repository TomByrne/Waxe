package wx.clay;

class Toolbox
{
   public static var LABEL_NONE = 0;
   public static var LABEL_RIGHT = 1;
   public static var LABEL_BOTTOM = 2;

   public function new(inParent:wx.Window, inLabelPos:Int=0, inRadioPreview:Bool = true,
	                    ?inSkin:ToolboxSkin, inName:String = "Toolbar" )
	{
	}

	public function addControl(inControl:wx.Window) : ToolboxTool
	{
		return null;
	}

	public function addSeparator()
	{
	}

}
