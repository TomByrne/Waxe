import wx.EventID;
import wx.Sizer;

class Sample
{
   var mFrame : wx.Frame;
   var mWindow : wx.Window;
   var mDrawArea : wx.Window;
	var mManager : wx.clay.Manager;

   function new()
   {
      mFrame = wx.Frame.create(null,"Main Frame");
      var count = 0;
		mManager = new wx.clay.Manager(mFrame);

      mFrame.onPaint = paintWindow;
      wx.App.setTopWindow(mFrame);
      mFrame.shown = true;
   }

   function paintWindow(dc:wx.DC)
   {
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
