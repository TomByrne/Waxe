package wx;

class Sizer
{
	public static var LEFT   = 0x0010;
   public static var RIGHT  = 0x0020;
   public static var UP     = 0x0040;
   public static var DOWN   = 0x0080;

   public static var TOP    = 0x0040;
   public static var BOTTOM = 0x0080;

   public static var ALL    = 0x00f0;

	public static var EXPAND = 0x2000;

   public static var ALIGN_NOT               = 0x0000;
   public static var ALIGN_CENTER_HORIZONTAL = 0x0100;
   public static var ALIGN_CENTRE_HORIZONTAL = 0x0100;
   public static var ALIGN_LEFT              = 0;
   public static var ALIGN_TOP               = 0;
   public static var ALIGN_RIGHT             = 0x0200;
   public static var ALIGN_BOTTOM            = 0x0400;
   public static var ALIGN_CENTER_VERTICAL   = 0x0800;
   public static var ALIGN_CENTRE_VERTICAL   = 0x0800;

   public static var ALIGN_CENTER            = 0x0900;
   public static var ALIGN_CENTRE            = 0x0900;

   public static var ALIGN_MASK              = 0x0f00;


	var wxHandle:Dynamic;

	function new(inHandle:Dynamic)
	{
		wxHandle = inHandle;
		if (wxHandle!=null)
			wx_set_data(wxHandle,this);
	}
	function _wx_deleted() { wxHandle = null; }

	public function add(sizerOrWindow:Dynamic, proportion:Int = 0, flag:Int = 0, border:Int = 0 )
	{
		var handle = Reflect.field(sizerOrWindow,"wxHandle");
		wx_sizer_add(wxHandle,handle,proportion,flag,border);
	}

	public function wxGetHandle() { return wxHandle; }

	static var wx_set_data = neko.Lib.load("waxe","wx_set_data",2);
   static var wx_get_data = neko.Lib.load("waxe","wx_get_data",1);
   static var wx_sizer_add = neko.Lib.load("waxe","wx_sizer_add",5);

}



