#include <HaxeAPI.h>

// --- MenuBar ----------------------------------------------

value wx_menu_bar_create()
{
   return WXToValue( new wxMenuBar() );
}

DEFINE_PRIM(wx_menu_bar_create,0);


// --- Menu ----------------------------------------------

value wx_menu_create(value inTitle, value inFlags)
{
   wxMenu *menu =  new wxMenu( Val2Str(inTitle), val_int(inFlags) );
   return WXToValue( menu );
}

DEFINE_PRIM(wx_menu_create,2)




