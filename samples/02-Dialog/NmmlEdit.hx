import wx.Window;
import wx.EventID;
import wx.Sizer;
import wx.Panel;
import wx.StaticBox;
import wx.StaticBoxSizer;

class NmmlEdit
{
   var root:Window;
   var items_sizer:wx.FlexGridSizer;
   var dialogSizer:Sizer;

   function new()
   {
      var frame = ApplicationMain.frame;
      root = frame;
      frame.onClose = function(_) ApplicationMain.frame.destroy();


      root = ApplicationMain.frame;


      dialogSizer = wx.BoxSizer.create(true);

      var box_sizer = StaticBoxSizer.create(true,root,"Application");
      dialogSizer.add(box_sizer,0,Sizer.EXPAND|Sizer.BORDER_ALL,4);

      items_sizer    = wx.FlexGridSizer.create(null,2);
      items_sizer.addGrowableCol(1,1);
      box_sizer.add(items_sizer,1,Sizer.EXPAND);


      addLabel("Main Class");
      var cls = wx.TextCtrl.create(root,null,"Main" );
      addControl(cls);

      addLabel("Exe Name");
      var exe = wx.TextCtrl.create(root,null,"Game" );
      addControl(exe);

      addLabel("Title");
      var title = wx.TextCtrl.create(root,null,"My Game" );
      addControl(title);

      addLabel("Package");
      var pkg = wx.TextCtrl.create(root,null,"org.waxe.MyGame" );
      addControl(pkg);

      addLabel("Version");
      var version = wx.TextCtrl.create(root,null,"1.0" );
      addControl(version);

      addLabel("Waxe Frame Style");
      var style = wx.ComboBox.create(root,null,"", ["Frame","Dialog","MDIParentFrame"]);
      addControl(style);


      var box_sizer = StaticBoxSizer.create(true,root,"Window");
      dialogSizer.add(box_sizer,0,Sizer.EXPAND|Sizer.BORDER_ALL,4);

      items_sizer    = wx.FlexGridSizer.create(null,2);
      items_sizer.addGrowableCol(1,1);
      box_sizer.add(items_sizer,1,Sizer.EXPAND);

      addLabel("Width");
      var width = wx.TextCtrl.create(root,null,"800" );
      addControl(width);

      addLabel("Height");
      var width = wx.TextCtrl.create(root,null,"600" );
      addControl(width);

      addLabel("FPS");
      var fps = wx.TextCtrl.create(root,null,"60" );
      addControl(fps);

      addLabel("Background");
      var bg = wx.TextCtrl.create(root,null,"0xffffff" );
      addControl(bg);

      addLabel("Orientation");
      var orientation = wx.ComboBox.create(root,null,"", ["landscape","portrait"]);
      addControl(orientation);


      var button_sizer = wx.BoxSizer.create(false);
      dialogSizer.add(button_sizer,0,
         Sizer.ALIGN_CENTRE | Sizer.BORDER_TOP | Sizer.BORDER_BOTTOM, 10);

      var load = wx.Button.create(root,null,"Load");
      load.onClick = function(_) trace("Load!");
      button_sizer.add(load);

      var save = wx.Button.create(root,null,"Save");
      save.onClick = function(_) trace("Save!");
      button_sizer.add(save);

      var saveas = wx.Button.create(root,null,"Save As");
      saveas.onClick = function(_) trace("Save As!");
      button_sizer.add(saveas);

      var close = wx.Button.create(root,null,"Close");
      close.onClick = function(_) wx.App.quit();
      button_sizer.add(close);

 


      root.sizer = dialogSizer;
      dialogSizer.setSizeHints(ApplicationMain.frame);
   }

   function addLabel(inLabel:String)
   {
      var txt = wx.StaticText.create(root,null,inLabel);
      items_sizer.add(txt,0,Sizer.ALIGN_CENTRE_VERTICAL|Sizer.BORDER_ALL,2);
   }

   function addControl(inCtrl:Window)
   {
      items_sizer.add(inCtrl,1,Sizer.EXPAND | Sizer.BORDER_ALL, 4);
   }

   public static function main()
   {
      new NmmlEdit();
   }
}
