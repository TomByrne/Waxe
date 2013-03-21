#include "HaxeAPI.h"

value wx_tool_tip_create(value tip)
{
   wxToolTip *window = new wxToolTip(Val2Str(tip));

   return WXToValue(window);
}
DEFINE_PRIM(wx_tool_tip_create,1)


value wx_tool_tip_set_tip(value inWindow, value tip) 
{ 
  wxToolTip *window; 
  if (!ValueToWX(inWindow,window)) 
    val_throw(alloc_string("Invalid Window")); 
  window->SetTip(Val2Str(tip)); 
  return alloc_null();
} 
DEFINE_PRIM(wx_tool_tip_set_tip,2);


value wx_tool_tip_get_tip(value inWindow) 
{ 
  wxToolTip *window; 
  if (!ValueToWX(inWindow,window)) 
    val_throw(alloc_string("Invalid Window")); 
  return WXToValue(window->GetTip());
} 
DEFINE_PRIM(wx_tool_tip_get_tip, 1);