package wx;

class DC
{
	public var pen(null,setPen):Pen;
	var wxHandle:Dynamic;

	function new(handle:Dynamic)
	{
		wxHandle = handle;
	}
	public function destroy() { wx_object_destroy(wxHandle); }

	public function drawLine(x1:Int, y1:Int, x2:Int, y2:Int)
	{
		wx_dc_draw_line(wxHandle,x1,y1,x2,y2);
	}
   public function clear()
   {
      wx_dc_clear(wxHandle);
   }
	public function setPen(inPen:Pen) : Pen
	{
		wx_dc_set_pen(wxHandle,inPen.wxGetHandle());
		return inPen;
	}

	static public function createPaintDC(inWindow:Window)
	{
		return new DC(wx_dc_create_paint(inWindow.wxGetHandle()));
	}

	static var wx_dc_create_paint = neko.Lib.load("waxe","wx_dc_create_paint",1);
	static var wx_dc_draw_line = neko.Lib.load("waxe","wx_dc_draw_line",5);
	static var wx_object_destroy = neko.Lib.load("waxe","wx_object_destroy",1);
	static var wx_dc_clear = neko.Lib.load("waxe","wx_dc_clear",1);
	static var wx_dc_set_pen = neko.Lib.load("waxe","wx_dc_set_pen",2);
}
