#include <HaxeAPI.h>
#include <wx/glcanvas.h>

value wx_glcanvas_create(value inParams)
{
	CreationParams params(inParams);
    wxGLCanvas *window = new wxGLCanvas(params.parent,params.id,
										  params.position,params.size,params.flags);

    int x,y;
    // Hack to fake a resize to get wxwindows to render before a reszie
    //window->GetParent()->GetSize(&x, &y);
    //window->GetParent()->SetSize(-1, -1, x + 1, y, wxSIZE_USE_EXISTING);
    //window->GetParent()->SetSize(-1, -1, x, y, wxSIZE_USE_EXISTING);

   return WXToValue(window);
}
DEFINE_PRIM(wx_glcanvas_create,1)

value wx_glcanvas_make_current(value inCanvas)
{
	wxGLCanvas *canvas;
	if (ValueToWX(inCanvas,canvas))
   {
		canvas->SetCurrent();
   }
	return alloc_null();
}
DEFINE_PRIM(wx_glcanvas_make_current,1)

value wx_glcanvas_flip(value inCanvas)
{
	wxGLCanvas *canvas;
	if (ValueToWX(inCanvas,canvas))
		canvas->SwapBuffers();
	return alloc_null();
}
DEFINE_PRIM(wx_glcanvas_flip,1)

