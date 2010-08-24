#ifndef TOOL_BOX_H
#define TOOL_BOX_H

#include <wx/wx.h>
#include <vector>


namespace clay
{

enum ToolButtonLabel { tblNone, tblRight, tblBottom };

class ToolBoxTool;


class ToolBox
{
public:
   static ToolBox *Create(wxWindow *inParent,
                  ToolButtonLabel inLabelPos = tblNone,
                  bool inRadioPreview = true,
                  class ToolBoxSkin *inSkin = 0,
                  const wxString &inName="Toolbar");

   // Since toolbox is a wxWindow, you probalbly don't need to call this
   //  explicity.
   virtual ~ToolBox() { }

   // For using it as a parent for controls
   virtual operator wxWindow *() = 0;

   virtual ToolBoxTool *AddControl(wxWindow *inControl) = 0;

   virtual ToolBoxTool* AddTool(int inToolID, const wxString& label,
           const wxBitmap& bitmap1,
           const wxString& shortHelpString = "",
           wxItemKind kind = wxITEM_NORMAL) = 0;

   virtual ToolBoxTool* AddTool(int inToolID, const wxString& label,
           const wxBitmap& bitmap1,
           const wxBitmap& bitmap2,
           wxItemKind kind = wxITEM_NORMAL,
           const wxString& shortHelpString = "",
           const wxString& longHelpString = "",
           wxObject* clientData = NULL)
   {
      return AddTool(inToolID,label,bitmap1,shortHelpString,kind);
   }


   virtual void AddSeparator()=0;

   virtual void DoLayout(wxSize &ioSize,bool inFitWidth) = 0;

   virtual void ApplyLayout() = 0;

   virtual void Realize() = 0;

   virtual bool GetToolState(int toolId) const = 0;
};

} // end namespace clay

#endif
