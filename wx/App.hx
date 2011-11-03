package wx;

class App
{
  public static function boot(inOnInit:Void -> Void)
  {
     #if neko
     var init = neko.Lib.load("waxe","neko_init",5);
     if (init!=null)
     {
         init(function(s) return new String(s),
           function(len:Int) { var r=[]; if (len>0) r[len-1]=null; return r; },
           null, true, false );
      }
     else
         throw("Could not find NekoAPI interface.");
     #end

     wx_boot(inOnInit);
  }
 
 
  public static function quit()
  {
     wx_quit();
  }

  public static function setTopWindow(inWindow:TopLevelWindow)
  {
     wx_set_top_window(inWindow.wxHandle);
  }


  static var wx_set_top_window = neko.Lib.load("waxe","wx_set_top_window",1);
  static var wx_boot = neko.Lib.load("waxe","wx_boot",1);
  static var wx_quit = neko.Lib.load("waxe","wx_quit",0);
}
