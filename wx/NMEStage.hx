package wx;

import wx.Window;
import nme.display.ManagedStage;


class NMEStage extends GLCanvas
{
   public var stage(default,null) : ManagedStage;

   function new(inHandle:Dynamic)
	{
	   super(inHandle);
		var s = getClientSize();
		var me = this;
		stage = new nme.display.ManagedStage(s.width,s.height);
		stage.beginRender = me.makeCurrent;
		stage.endRender = me.flip;
		stage.setNextWake = me.setNextWake;
		onSize = function(event:Dynamic)
		{
		   var s = me.getClientSize();
		   me.stage.resize(s.width,s.height);
		}
		onPaint = render;

	}


	override function HandleEvent(event:Dynamic)
	{
	   super.HandleEvent(event);
	}

	function setNextWake(inDelay:Float)
	{
	}

	function render(_)
	{
		stage.nmeRender(true);
	}

	public static function create(inParent:Window,?inID:Int,?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
      if (inParent==null)
         throw Error.INVALID_PARENT;
      var handle = GLCanvas.wx_glcanvas_create([inParent.wxHandle,inID,"",inPosition,inSize, inStyle] );
      return new NMEStage(handle);
   }


}
