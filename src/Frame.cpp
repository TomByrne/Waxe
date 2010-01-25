#include <HaxeAPI.h>

value wx_frame_create(value inParams)
{
	CreationParams params(inParams,wxDEFAULT_FRAME_STYLE);
   wxFrame *frame = new wxFrame(params.parent,params.id,params.text,
										  params.position,params.size,params.flags);

   frame->Show();
   wxTheApp->SetTopWindow( frame );

   return WXToValue(frame);
}

DEFINE_PRIM(wx_frame_create,1)
