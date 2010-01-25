import wx.EventID;
import wx.Sizer;

class Simple
{
	var mFrame : wx.Frame;
	var mWindow : wx.Window;

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
		mFrame.onClick = onClick;

		mWindow = wx.Panel.create(mFrame);

		var sizer = wx.BoxSizer.create(true);
		var text = wx.TextCtrl.create(mWindow,null,"Hello !", {x:10,y:10} );
		sizer.add(text,1,Sizer.EXPAND,20);
		var text = wx.TextCtrl.create(mWindow,null,"Hello !", {x:10,y:100} );
		sizer.add(text,1,Sizer.EXPAND,20);
		var text = wx.TextCtrl.create(mWindow,null,"Hello !", {x:10,y:200} );
		sizer.add(text,1,Sizer.EXPAND,20);
		mWindow.sizer = sizer;
      mWindow.fit();
		layout();
   }

	function layout()
	{
		mWindow.size = mFrame.clientSize;
	}

	function onClick(inEvent)
	{
		trace(inEvent);
	}


   public static function main()
   {
      wx.App.boot( function(){ new Simple(); } );
   }
}
