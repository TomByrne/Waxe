#include <HaxeAPI.h>

value wx_dc_create_paint(value inWindow)
{
	wxWindow *window;
	if (ValueToWX(inWindow,window))
	{
		wxPaintDC *dc = new wxPaintDC(window);
		return WXToDeletingValue(dc);
	}
}
DEFINE_PRIM(wx_dc_create_paint,1)


value wx_dc_draw_line(value inDC, value inX1, value inY1, value inX2, value inY2)
{
	wxDC *dc;
	if (ValueToWX(inDC,dc))
	{
		dc->DrawLine(val_int(inX1), val_int(inY1), val_int(inX2), val_int(inY2) );
	}
	return alloc_null();
}
DEFINE_PRIM(wx_dc_draw_line,5)

