package wx;

class App
{
  public static function boot(inOnInit:Void -> Void)
  {
     wx_boot(inOnInit);
  }
 
 
  public static function quit()
  {
     wx_quit();
  }

  public static function setTopWindow(inWindow:TopLevelWindow)
  {
     wx_set_top_window(inWindow);
  }


  static var wx_set_top_window = neko.Lib.load("waxe","wx_set_top_window",1);
  static var wx_boot = neko.Lib.load("waxe","wx_boot",1);
  static var wx_quit = neko.Lib.load("waxe","wx_quit",0);
}
