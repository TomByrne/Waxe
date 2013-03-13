#include "HaxeAPI.h"

value wx_scrolled_window_create(value inParams)
{
	CreationParams params(inParams);
   wxScrolledWindow *window = new wxScrolledWindow(params.parent,params.id,
										  params.position,params.size,params.flags);
   return WXToValue(window);
}
DEFINE_PRIM(wx_scrolled_window_create,1)

value wx_scrolled_window_set_scrollbars(value inWindow, value pixelsPerUnitX, value pixelsPerUnitY, value noUnitsX, value noUnitsY, value xPos, value yPos, value noRefresh)
{
   wxScrolledWindow *window;
  if (ValueToWX(inWindow,window))
  {
    window->SetScrollbars(val_int(pixelsPerUnitX), val_int(pixelsPerUnitY), val_int(noUnitsX), val_int(noUnitsY), val_int(xPos), val_int(yPos), Val2Bool(noRefresh));
  }

   return alloc_null();
}

DEFINE_PRIM(wx_scrolled_window_set_scrollbars,8)