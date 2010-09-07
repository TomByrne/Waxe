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

value wx_scintilla_set_value(value inSci, value inString)
{
   wxScintilla *sci;
   if (ValueToWX(inSci, sci))
   {
      sci->SetText( Val2Str(inString) );
   }
   return alloc_null();
}
DEFINE_PRIM(wx_scintilla_set_value,2)


value wx_scintilla_get_value(value inSci)
{
   wxScintilla *sci;
   if (ValueToWX(inSci, sci))
      return WXToValue( sci->GetText( ) );

   return alloc_null();
}
DEFINE_PRIM(wx_scintilla_get_value,1)


//WIN_PROPERTY(wx_scintilla,wxScintilla,label,GetLabel,SetLabel,Val2Str)

