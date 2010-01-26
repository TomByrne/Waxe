import wx.EventID;
import wx.Sizer;

class Simple
{
	var mFrame : wx.Frame;
	var mWindow : wx.Window;
	var mDrawArea : wx.Window;

   function new()
   {
      mFrame = wx.Frame.create(null,"Main Frame");
		var count = 0;
		/*
		mFrame.onClose = function(ioEvent)
		{
			count++;
			if (count<2)
			{
				trace("Sorry, try again...");
				ioEvent.veto = true;
			}
			else
				ioEvent.skip = true;
		}
		*/
		var me = this;
		mFrame.onSize = function(evt) { me.layout(); evt.skip=true; }

		mWindow = wx.Panel.create(mFrame);
		mDrawArea = wx.Panel.create(mFrame);

		var vertical_sizer = wx.FlexGridSizer.create(null,1);
		vertical_sizer.addGrowableCol(0);
		vertical_sizer.addGrowableRow(1);
		var items_sizer = wx.FlexGridSizer.create(null,2);
		var button_sizer = wx.BoxSizer.create(false);
		vertical_sizer.add(items_sizer,0,Sizer.EXPAND);
		vertical_sizer.add(mDrawArea,1,Sizer.EXPAND);
		vertical_sizer.add(button_sizer,0,
		   Sizer.ALIGN_CENTRE | Sizer.BORDER_TOP | Sizer.BORDER_BOTTOM, 10);
      var close = wx.Button.create(mWindow,null,"Close");
		button_sizer.add(close);


		items_sizer.addGrowableCol(1,1);
		var text = wx.TextCtrl.create(mWindow,null,"Hello !" );
		items_sizer.add(wx.StaticText.create(mWindow,null,"Text 1"),0,Sizer.ALIGN_CENTRE_VERTICAL);
		items_sizer.add(text,1,Sizer.EXPAND | Sizer.BORDER_ALL, 10);
		var text = wx.TextCtrl.create(mWindow,null,"Hello !" );
		items_sizer.add(wx.StaticText.create(mWindow,null,"Text 2"),0,Sizer.ALIGN_CENTRE_VERTICAL);
		items_sizer.add(text,1,Sizer.EXPAND | Sizer.BORDER_ALL, 10);
		var text = wx.TextCtrl.create(mWindow,null,"Hello !" );
		items_sizer.add(wx.StaticText.create(mWindow,null,"Text 3"),0,Sizer.ALIGN_CENTRE_VERTICAL);
		items_sizer.add(text,1,Sizer.EXPAND | Sizer.BORDER_ALL, 10);

		mWindow.sizer = vertical_sizer;

		mDrawArea.backgroundColour = 0xffffff;
		close.onClick = function(_) wx.App.quit();

		layout();

		mDrawArea.onPaint = paintWindow;
		wx.App.setTopWindow(mFrame);
		mFrame.shown = true;
   }

	function paintWindow(_)
	{
		var dc = wx.DC.createPaintDC(mDrawArea);
		dc.drawLine(0,0,300,250);
		dc.destroy();
	}

	function layout()
	{
		mWindow.size = mFrame.clientSize;
	}

   public static function main()
   {
      wx.App.boot( function(){ new Simple(); } );
   }
}
