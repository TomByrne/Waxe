package wx;

class DC
{
   public var pen(null,setPen):Pen;
   public var brush(null,setBrush):Brush;
   public var background(null,setBackground):Brush;
   public var font(null,setFont):Font;
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
   public function setBrush(inBrush:Brush) : Brush
   {
      wx_dc_set_brush(wxHandle,inBrush.wxGetHandle());
      return inBrush;
   }
   public function setBackground(inBrush:Brush) : Brush
   {
      wx_dc_set_background(wxHandle,inBrush.wxGetHandle());
      return inBrush;
   }
   public function setFont(inFont:Font) : Font
   {
      wx_dc_set_font(wxHandle,inFont.wxGetHandle());
      return inFont;
   }
   public function drawRectangle(x:Int, y:Int, width:Int, height:Int)
   {
      wx_dc_draw_rectangle(wxHandle,x,y,width,height);
   }
   public function drawCircle(x:Int, y:Int, rad:Int)
   {
      wx_dc_draw_circle(wxHandle,x,y,rad);
   }
   public function drawEllipse(x:Int, y:Int, width:Int, height:Int)
   {
      wx_dc_draw_ellipse(wxHandle,x,y,width,height);
   }
   public function drawText(text:String,x:Int, y:Int)
   {
      wx_dc_draw_text(wxHandle,text,x,y);
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
   static var wx_dc_set_font = neko.Lib.load("waxe","wx_dc_set_font",2);
   static var wx_dc_set_brush = neko.Lib.load("waxe","wx_dc_set_brush",2);
   static var wx_dc_set_background = neko.Lib.load("waxe","wx_dc_set_background",2);
   static var wx_dc_draw_rectangle = neko.Lib.load("waxe","wx_dc_draw_rectangle",5);
   static var wx_dc_draw_circle = neko.Lib.load("waxe","wx_dc_draw_circle",4);
   static var wx_dc_draw_ellipse = neko.Lib.load("waxe","wx_dc_draw_ellipse",5);
   static var wx_dc_draw_text = neko.Lib.load("waxe","wx_dc_draw_text",4);
}