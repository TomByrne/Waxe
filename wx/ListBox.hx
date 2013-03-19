package wx;

import wx.Window;

class ListBox extends ControlWithItems
{
   public static inline var NO_SELECTION = -1;
   
	public var onSelected(null,setOnSelected) : Dynamic->Void;
	public var onDClick(null,setOnDClick) : Dynamic->Void;
   public var selection(getSelection,setSelection) : Int;

   public static function create(inParent:Window, ?inID:Null<Int>,
	                ?inPosition:Position,
                   ?inSize:Size, ?inValues:Array<String>, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
      var handle = wx_list_box_create(
			[inParent.wxHandle,inID,"",inPosition,inSize, inStyle], inValues );
      return new ListBox(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

	function setOnSelected(f:Dynamic->Void)
	   {setHandler(wx.EventID.COMMAND_LISTBOX_SELECTED,f); return f;}
	function setOnDClick(f:Dynamic->Void)
	   {setHandler(wx.EventID.COMMAND_LISTBOX_DOUBLECLICKED,f); return f;}




   public function set(insertArray:Array<String>)  { wx_list_box_set(wxHandle,insertArray); }
   static var wx_list_box_set = Loader.load("wx_list_box_set",2);
   


   static var wx_list_box_create = Loader.load("wx_list_box_create",2);
}
