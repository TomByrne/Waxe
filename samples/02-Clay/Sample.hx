import wx.EventID;
import wx.Sizer;

import wx.clay.AddPosition;

class Sample
{
   var mFrame : wx.Frame;
   var mManager : wx.clay.Manager;
   var mBmp:wx.Bitmap;

   function new()
   {
      mFrame = wx.MDIParentFrame.create(null,"Main Frame",null,{width:800,height:600} );
      mManager = new wx.clay.Manager(mFrame);
      var root = mManager.root;

      var content = wx.Panel.create(mFrame,null,null,{width:200,height:200});
      content.name = "Panel 1";
      content.onPaint = paintWindow;
      var c1 = mManager.root.addWindow(content,AddPosition.Left);

      var content = wx.Panel.create(mFrame,null,null,{width:200,height:200});
      content.name = "Panel 2";
      content.onPaint = paintWindow;
      root.addWindow(content,AddPosition.Over);

      var content = wx.Panel.create(mFrame,null,null,{width:50,height:50});
      content.name = "Panel 3";
      content.onPaint = paintWindow;
      var container = root.addWindow(content,AddPosition.Over);
      container.minWidth = 200;
      container.minHeight = 200;

      mBmp = wx.Bitmap.fromResource("bitmaps/new.bmp");
      var toolbar = new wx.clay.Toolbox(mFrame,"Toolbar 1");
      var id = 1000;
      toolbar.addControl(wx.ComboBox.create(toolbar,null,"Combo",null, ["Opt 1","Opt 2"] ));
      toolbar.addSeparator();
      mFrame.handle(toolbar.addTool(id++, "New", BMP("new"), false, "Create new thingy" ), onNew );
      toolbar.addTool(id++, "Open", BMP("open"), false, "Open" );
      toolbar.addTool(id++, "Save", BMP("save"), false, "Save" );
      toolbar.addTool(id++, "Print", BMP("print"), false, "Print" );
      toolbar.addSeparator();
      toolbar.addTool(id++, "Cut", BMP("cut"), false, "Cut" );
      toolbar.addTool(id++, "Copy", BMP("copy"), false, "Copy" );
      toolbar.addTool(id++, "Paste", BMP("paste"), false, "Paste" );
      root.addToolbox(toolbar,AddPosition.Above);

      var bar = new wx.MenuBar();
      var menu = new wx.Menu();
      mFrame.handle(menu.append(id++,"Hello!"),function(_)  trace("Hello") );
      mFrame.handle(menu.append(id++,"Goodbye!"),function(_)  trace("Goodbye") );

      bar.append(menu,"File");
      mFrame.menuBar = bar;

      wx.App.setTopWindow(mFrame);
      mFrame.shown = true;
   }

   function BMP(inName:String) { return wx.Bitmap.fromResource("bitmaps/" + inName + ".bmp"); }

   function onNew(inEvent:Dynamic)
   {
      var content = wx.Scintilla.create(mFrame,null,null,{width:200,height:200});
      content.name = "Sample.hx";
      content.value = neko.io.File.getContent("Sample.hx");
      mManager.root.addWindow(content,AddPosition.Over);
   }


   function paintWindow(dc:wx.DC)
   {
      dc.background = new wx.Brush( wx.Colour.White(), wx.Brush.SOLID );
      dc.clear();
      dc.pen = new wx.Pen( wx.Colour.Pink(), 3 );
      dc.drawLine(0,0,300,250);
      dc.brush = new wx.Brush( wx.Colour.Yellow(), wx.Brush.SOLID );
      dc.drawRectangle(100,100,100,200);
      dc.brush = new wx.Brush( wx.Colour.DarkGreen(), wx.Brush.SOLID );
      dc.pen = new wx.Pen( wx.Colour.Black(), 3, wx.Pen.SHORT_DASH );
      dc.drawCircle(100,10,50);
      dc.drawEllipse(100,200,200,40);
      dc.font = new wx.Font(20);
      dc.drawText("Hello!",20,20);
      dc.drawBitmap(mBmp,100,100,true);
   }

   public static function main()
   {
      wx.App.boot( function(){ new Sample(); } );
   }
}
