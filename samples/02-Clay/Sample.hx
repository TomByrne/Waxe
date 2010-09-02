import wx.EventID;
import wx.Sizer;

import wx.clay.AddPosition;

class Sample
{
   var mFrame : wx.Frame;
   var mManager : wx.clay.Manager;

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

      var toolbar = new wx.clay.Toolbox(mFrame,"Toolbar 1");
      toolbar.addControl(wx.ComboBox.create(toolbar,null,"Combo",null, ["Opt 1","Opt 2"] ));
      toolbar.addSeparator();
      root.addToolbox(toolbar,AddPosition.Above);

      wx.App.setTopWindow(mFrame);
      mFrame.shown = true;
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
   }

   public static function main()
   {
      wx.App.boot( function(){ new Sample(); } );
   }
}
