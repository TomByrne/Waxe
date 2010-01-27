package wx;

typedef Position = { x:Int, y:Int };
typedef Size = { width:Int, height:Int };

class Window
{
   var wxHandle:Dynamic;
	var wxEventHandlers:IntHash<Dynamic->Void>;

	public static var INVALID_PARENT = "Invalid Parent";


   public var size(getSize,setSize):Size;
   public var sizer(getSizer,setSizer):Sizer;
   public var clientSize(getClientSize,setClientSize):Size;
   public var position(getPosition,setPosition):Position;
   public var shown(isShown,show):Bool;
   public var backgroundColour(getBackgroundColour,setBackgroundColour):Int;


	public static function create(inParent:Window,?inID:Int,?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
      var handle = wx_window_create([inParent.wxHandle,inID,"",inPosition,inSize, inStyle] );
      return new Window(handle);
   }

   function new(inHandle:Dynamic)
   {
      wxHandle = inHandle;
      if (wxHandle!=null)
         wx_set_window_handler(wxHandle,this);
	   wxEventHandlers = new IntHash<Dynamic->Void>();
   }

	// These two functions are called by the external DLL...
	function _wx_deleted() { wxHandle = null; }
	function _handle_event(event:Dynamic) { HandleEvent(event); }
	public function wxGetHandle() { return wxHandle;}


   function HandleEvent(event:Dynamic)
   {
      //trace("HandleEvent : " + event);
      event.name = neko.Lib.nekoToHaxe(event.name);

      var type:Int = event.type;

		// Debug event type...
		if (false)
		{
			var e = Type.createEnumIndex( wx.EventID, type );
			trace(type + ":" + e);
		}

		if (wxEventHandlers.exists(type))
		{
		   var func = wxEventHandlers.get(type);
			if (func!=null)
			{
				event.skip = false;
				func(event);
			}
		}
   }

	public function setHandler(inID:EventID,inFunc:Dynamic->Void)
	{
	   wxEventHandlers.set(Type.enumIndex(inID),inFunc);
	}

	public function fit() { wx_window_fit(wxHandle); }

	public function getSize() : Size { return wx_window_get_size(wxHandle); }
	public function setSize(inSize:Size) : Size
	{
		wx_window_set_size(wxHandle, inSize);
		return inSize;
	}

	public function getSizer() : Sizer { return wx_window_get_sizer(wxHandle); }
	public function setSizer(inSizer:Sizer) : Sizer
	{
		wx_window_set_sizer(wxHandle, inSizer.wxGetHandle());
		return inSizer;
	}

	public function getClientSize() : Size { return wx_window_get_client_size(wxHandle); }
	public function setClientSize(inSize:Size) : Size
	{
		wx_window_set_client_size(wxHandle, inSize.width, inSize.height);
		return inSize;
	}

	public function getPosition() : Position { return wx_window_get_position(wxHandle); }
	public function setPosition(inPos:Position) : Position
	{
		wx_window_set_position(wxHandle, inPos);
		return inPos;
	}

	public function isShown() : Bool { return wx_window_get_shown(wxHandle); }
	public function show(inShow:Bool = true) : Bool
	{
		wx_window_set_shown(wxHandle, inShow);
		return inShow;
	}

	public function getBackgroundColour() : Int { return wx_window_get_bg_colour(wxHandle); }
	public function setBackgroundColour(inColour:Int) : Int
	{
		wx_window_set_bg_colour(wxHandle, inColour);
		return inColour;
	}



   // Helpers ...
	public var onClose(null,setOnClose) : Dynamic->Void;
	function setOnClose(f:Dynamic->Void) {setHandler(wx.EventID.CLOSE_WINDOW,f); return f;}
	public var onSize(null,setOnSize) : Dynamic->Void;
	function setOnSize(f:Dynamic->Void) {setHandler(wx.EventID.SIZE,f); return f;}
	public var onPaint(null,setOnPaint) : DC->Void;
	function setOnPaint(f:DC->Void)
   {
      var me = this;
      setHandler(wx.EventID.PAINT, function(_)
         { var dc = wx.DC.createPaintDC(me); f(dc); dc.destroy(); } );
      return f;
   }



   static var wx_window_get_position = neko.Lib.load("waxe","wx_window_get_position",1);
   static var wx_window_set_position = neko.Lib.load("waxe","wx_window_set_position",2);
   static var wx_window_get_size = neko.Lib.load("waxe","wx_window_get_size",1);
   static var wx_window_set_size = neko.Lib.load("waxe","wx_window_set_size",2);
   static var wx_window_get_client_size = neko.Lib.load("waxe","wx_window_get_client_size",1);
   static var wx_window_set_client_size = neko.Lib.load("waxe","wx_window_set_client_size",2);
   static var wx_window_create = neko.Lib.load("waxe","wx_window_create",1);
   static var wx_set_window_handler = neko.Lib.load("waxe","wx_set_window_handler",2);
   static var wx_get_window_handler = neko.Lib.load("waxe","wx_get_window_handler",1);
   static var wx_window_set_sizer = neko.Lib.load("waxe","wx_window_set_sizer",2);
   static var wx_window_get_sizer = neko.Lib.load("waxe","wx_window_get_sizer",1);
   static var wx_window_fit = neko.Lib.load("waxe","wx_window_fit",1);
   static var wx_window_get_shown = neko.Lib.load("waxe","wx_window_get_shown",1);
   static var wx_window_set_shown = neko.Lib.load("waxe","wx_window_set_shown",2);
   static var wx_window_get_bg_colour = neko.Lib.load("waxe","wx_window_get_bg_colour",1);
   static var wx_window_set_bg_colour = neko.Lib.load("waxe","wx_window_set_bg_colour",2);
}


