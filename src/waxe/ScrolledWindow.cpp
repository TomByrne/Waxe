#include "HaxeAPI.h"

value wx_scrolled_window_create(value inParams)
{
	CreationParams params(inParams);
   wxScrolledWindow *window = new wxScrolledWindow(params.parent,params.id,
										  params.position,params.size,params.flags);
   return WXToValue(window);
}
DEFINE_PRIM(wx_scrolled_window_create,1)


// args = inWindow, pixelsPerUnitX, pixelsPerUnitY, noUnitsX, noUnitsY, xPos, yPos, noRefresh
value wx_scrolled_window_set_scrollbars(value inParams)
{
    wxScrolledWindow *window;
   if (ValueToWX(val_array_i(inParams,0),window))
   {
     window->SetScrollbars(val_int(val_array_i(inParams,1)),
                            val_int(val_array_i(inParams,2)),
                            val_int(val_array_i(inParams,3)),
                            val_int(val_array_i(inParams,4)),
                            val_int(val_array_i(inParams,5)),
                            val_int(val_array_i(inParams,6)),
                            Val2Bool(val_array_i(inParams,7)));
   }

   return alloc_null();
}

DEFINE_PRIM(wx_scrolled_window_set_scrollbars,1)