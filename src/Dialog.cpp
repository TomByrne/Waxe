#include <HaxeAPI.h>

value wx_dialog_create(value inParams)
{
	CreationParams params(inParams,wxDEFAULT_DIALOG_STYLE);
   wxDialog *frame = new wxDialog(params.parent,params.id,params.text,
										  params.position,params.size,params.flags);

   frame->Show();
   wxTheApp->SetTopWindow( frame );

   return WXToValue(frame);
}

DEFINE_PRIM(wx_dialog_create,1)
