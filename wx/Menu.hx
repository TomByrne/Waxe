package wx;

class Menu extends EventHandler
{
   public function new(inTitle:String="",inFlags:Int = 0)
   {
      super( wx_menu_create(inTitle,inFlags) );
   }

   override function HandleEvent(event:Dynamic)
   {
      trace("Menu Event!");
   }

   static var wx_menu_create = neko.Lib.load("waxe","wx_menu_create",2);
}



