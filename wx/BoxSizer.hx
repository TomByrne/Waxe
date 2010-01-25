package wx;

class BoxSizer extends Sizer
{
	function new(inHandle:Dynamic) { super(inHandle); }

	public static function create(inVertical:Bool)
	{
		return new BoxSizer( wx_sizer_create_box(inVertical) );
	}


	static var wx_sizer_create_box = neko.Lib.load("waxe","wx_sizer_create_box",1);

}
