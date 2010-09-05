package wx;

class Bitmap
{
   public var wxHandle:Dynamic;

   function new(inHandle:Dynamic) { wxHandle = inHandle; }

   public static function fromBytes(inBytes:haxe.io.Bytes)
   {
      return new Bitmap( wx_bitmap_from_bytes(inBytes.getData()) );
   }

   public static function fromResource(inResorceName:String)
   {
       return fromBytes( haxe.Resource.getBytes(inResorceName));
   }

   static var wx_bitmap_from_bytes = neko.Lib.load("waxe","wx_bitmap_from_bytes",1);
}
