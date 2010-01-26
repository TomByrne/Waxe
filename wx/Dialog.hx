package wx;

class Dialog extends TopLevelWindow
{

   public static function create(inParent:Window, ?inID:Int, inTitle:String="",
						?inPosition:{x:Float,y:Float},
                   ?inSize:{w:Float,h:Float}, ?inStyle:Int )
   {
      var handle = wx_dialog_create(
			[inParent==null ? null : inParent.wxHandle,inID,inTitle,inPosition,inSize, inStyle] );
      return new Frame(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

   static var wx_dialog_create = neko.Lib.load("waxe","wx_dialog_create",1);

}
