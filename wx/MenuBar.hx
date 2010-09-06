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
	public function append(inMenu:Menu, inTitle:String)
	{
	   wx_menu_bar_append(wxHandle, inMenu.wxHandle,inTitle);
	}

   static var wx_menu_bar_create = neko.Lib.load("waxe","wx_menu_bar_create",0);
   static var wx_menu_bar_append = neko.Lib.load("waxe","wx_menu_bar_append",3);
}


