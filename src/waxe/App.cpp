#include <wx/wx.h>
#include <wx/image.h>

#include <stdio.h>

#define NEKO_COMPATIBLE
#define IMPLEMENT_API

#include <hx/CFFI.h>
#include <HaxeAPI.h>


// --- Bootstrap Object ---------------------------

static value sgOnInit;

class wxWidgetsApp : public wxApp
{
public:
    wxWidgetsApp() { }
    virtual ~wxWidgetsApp() { }
    virtual bool OnInit()
    {
       wxImage::AddHandler(new wxGIFHandler);
       //wxXmlResource::Get()->InitAllHandlers();

       val_call0(sgOnInit);

       SetExitOnFrameDelete(true);

       return true;
    }

};

IMPLEMENT_APP_NO_MAIN(wxWidgetsApp)


// --- Interface ---------------------------------

value wx_boot(value inOnInit)
{
  sgOnInit = inOnInit;
  char *prog[] = {"prog",0};
  int argc = 1;
  int result =  wxEntry(argc,prog);
  return alloc_int(result);
}
DEFINE_PRIM(wx_boot,1)

value wx_quit()
{
   wxTheApp->ExitMainLoop();
   return val_null;
}
DEFINE_PRIM(wx_quit,0)

value wx_set_top_window(value inWindow)
{
	wxTopLevelWindow *window;
	if (ValueToWX(inWindow,window))
   	wxTheApp->SetTopWindow(window);
   return val_null;
}
DEFINE_PRIM(wx_set_top_window,1)




