import wx.Window;
import wx.EventID;
import wx.Sizer;
import wx.BoxSizer;
import wx.Panel;
import wx.StaticBox;
import wx.StaticBoxSizer;
import wx.CheckBox;

import neko.io.Process;

class NmmlEdit
{
   var root:Window;
   var items_sizer:Sizer;
   var dialogSizer:Sizer;

   function new()
   {
      var frame = ApplicationMain.frame;
      root = frame;
      frame.onClose = function(_) ApplicationMain.frame.destroy();

      root = ApplicationMain.frame;

      dialogSizer = BoxSizer.create(true);

      dialogSizer.add( createApplicationBox() ,0,Sizer.EXPAND|Sizer.BORDER_ALL,4);

      dialogSizer.add( createWindowBox() ,0,Sizer.EXPAND|Sizer.BORDER_ALL,4);

      dialogSizer.add( createIconBox() ,0,Sizer.EXPAND|Sizer.BORDER_ALL,4);

      dialogSizer.add( createHaxeLibBox() ,0,Sizer.EXPAND|Sizer.BORDER_ALL,4);

      dialogSizer.add(createButtons(),0,
         Sizer.ALIGN_CENTRE | Sizer.BORDER_TOP | Sizer.BORDER_BOTTOM, 10);

      root.sizer = dialogSizer;
      dialogSizer.setSizeHints(ApplicationMain.frame);
   }

   function createApplicationBox()
   {
      var box_sizer = StaticBoxSizer.create(true,root,"Application");

      var s = wx.FlexGridSizer.create(null,2);
      s.addGrowableCol(1,1);
      items_sizer = s;
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

      return box_sizer;
   }

   function createWindowBox()
   {
      // --- Window -------------------------
      var box_sizer = StaticBoxSizer.create(true,root,"Window");

      var s = wx.FlexGridSizer.create(null,2);
      s.addGrowableCol(1,1);
      items_sizer = s;
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

      return box_sizer;
   }

   function createIconBox()
   {
      var box_sizer = StaticBoxSizer.create(true,root,"Icon");

      var s = wx.FlexGridSizer.create(null,2);
      s.addGrowableCol(1,1);
      items_sizer = s;
      box_sizer.add(items_sizer,1,Sizer.EXPAND);

      addLabel("Icon");
      var icon = wx.TextCtrl.create(root,null,"" );
      addControl(icon);

      return box_sizer;
   }


   function createHaxeLibBox()
   {
      var box_sizer = StaticBoxSizer.create(true,root,"HaxeLibs");
      items_sizer = box_sizer;

      var libs = new Array<String>();
      var proc = new Process ("haxelib", ["list"]);
      try
      {
         while (true)
         {
            var line = proc.stdout.readLine ();
            var words = line.split(":");
            if (words.length>1)
               libs.push(words[0]);
         }
      } catch (e:Dynamic) { };
      proc.close();


      for(lib in libs)
      {
         var checkbox = CheckBox.create(root,null,lib );
         addControl(checkbox);
      }

      return box_sizer;
   }




   function createButtons()
   {
      var button_sizer = BoxSizer.create(false);

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

      return button_sizer;
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
