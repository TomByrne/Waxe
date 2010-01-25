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

  static var wx_boot = neko.Lib.load("waxe","wx_boot",1);
  static var wx_quit = neko.Lib.load("waxe","wx_quit",0);
}
