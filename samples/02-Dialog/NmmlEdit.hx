import wx.EventID;
import wx.Sizer;

class NmmlEdit
{
   function new()
   {
      ApplicationMain.frame.onClose = function(_) ApplicationMain.frame.destroy();

   }

   public static function main()
   {
      new NmmlEdit();
   }
}
