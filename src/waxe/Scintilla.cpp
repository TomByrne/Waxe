#include <HaxeAPI.h>
#include <wxscintilla.h>

value wx_scintilla_create(value inParams)
{
	CreationParams params(inParams);
   wxScintilla *window = new wxScintilla(params.parent,params.id,
					  params.position,params.size,params.flags);

   return WXToValue(window);
}
DEFINE_PRIM(wx_scintilla_create,1)


//WIN_PROPERTY(wx_scintilla,wxScintilla,label,GetLabel,SetLabel,Val2Str)

