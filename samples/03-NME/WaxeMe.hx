import wx.EventID;
import wx.Sizer;

class WaxeMe
{
   var mFrame : wx.Frame;
   var mStage : wx.NMEStage;

   function new()
   {
      mFrame = wx.Frame.create(null,"NME Frame");
      var count = 0;

      var me = this;
      mFrame.onSize = function(evt) { me.layout(); evt.skip=true; }

      mStage = wx.NMEStage.create(mFrame,null,null,{width:300,height:300});

		var s = new nme.display.Sprite();
		var gfx = s.graphics;
		gfx.beginFill(0xff0000);
		gfx.drawCircle(100,100,100);
		mStage.stage.addChild(s);

      wx.App.setTopWindow(mFrame);
      mFrame.shown = true;
   }

   function layout()
   {
      mStage.size = mFrame.clientSize;
   }

   public static function main()
   {
      wx.App.boot( function(){ new WaxeMe(); } );
   }
}
