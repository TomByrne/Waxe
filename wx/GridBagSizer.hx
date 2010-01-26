package wx;

class GridBagSizer extends FlexGridSizer
{
	function new(inHandle:Dynamic) { super(inHandle); }

	public static function create(vgap:Int=0,hgap:Int=0)
	{
		return new GridBagSizer( wx_sizer_create_grid_bag(rows,cols,vgap,hgap) );
	}


	static var wx_sizer_create_grid_bag = neko.Lib.load("waxe","wx_sizer_create_grid_bag",2);

}
