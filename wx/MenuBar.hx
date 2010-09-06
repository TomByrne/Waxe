package wx;

class MenuBar extends EventHandler
{
   public function new()
   {
      super( wx_menu_bar_create() );
   }

   override function HandleEvent(event:Dynamic)
   {
      trace("MenuBar Event!");
   }

   static var wx_menu_bar_create = neko.Lib.load("waxe","wx_menu_bar_create",0);
}


