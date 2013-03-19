package wx.clay;


//taken from defs.h

class StyleFlags{

    public static var HORIZONTAL              = 0x0004;
    public static var VERTICAL                = 0x0008;

	/*
	 * Window (Frame/dialog/subwindow/panel item) style flags
	 */
	public static var VSCROLL         = 0x80000000;
	public static var HSCROLL         = 0x40000000;
	public static var CAPTION         = 0x20000000;

	/*
	 * Styles for ListBox
	 */
	public static var LB_SORT           = 0x0010;
	public static var LB_SINGLE         = 0x0020;
	public static var LB_MULTIPLE       = 0x0040;
	public static var LB_EXTENDED       = 0x0080;
	/*  LB_OWNERDRAW is Windows-only */
	public static var LB_NEEDED_SB      = 0x0000;
	public static var LB_OWNERDRAW      = 0x0100;
	public static var LB_ALWAYS_SB      = 0x0200;
	public static var LB_NO_SB          = 0x0400;
	public static var LB_HSCROLL        = HSCROLL;
	/*  always show an entire number of rows */
	public static var LB_INT_HEIGHT     = 0x0800;


	/*
	 * ComboBox style flags
	 */
	public static var CB_SIMPLE         = 0x0004;
	public static var CB_SORT           = 0x0008;
	public static var CB_READONLY       = 0x0010;
	public static var CB_DROPDOWN       = 0x0020;

	/*
	 * RadioBox style flags
	 */
	/*  should we number the items from left to right or from top to bottom in a 2d */
	/*  radiobox? */
	public static var RA_LEFTTORIGHT    = 0x0001;
	public static var RA_TOPTOBOTTOM    = 0x0002;

	/*  New, more intuitive names to specify majorDim argument */
	public static var RA_SPECIFY_COLS   = HORIZONTAL;
	public static var RA_SPECIFY_ROWS   = VERTICAL;

	/*  Old names for compatibility */
	public static var RA_HORIZONTAL     = HORIZONTAL;
	public static var RA_VERTICAL       = VERTICAL;
	public static var RA_USE_CHECKBOX   = 0x0010; /* alternative native subcontrols (PalmOS) */

	/*
	 * RadioButton style flag
	 */
	public static var RB_GROUP          = 0x0004;
	public static var RB_SINGLE         = 0x0008;
	public static var RB_USE_CHECKBOX   = 0x0010; /* alternative native control (PalmOS) */

	/*
	 * ScrollBar flags
	 */
	public static var SB_HORIZONTAL      = HORIZONTAL;
	public static var SB_VERTICAL        = VERTICAL;

	/*
	 * SpinButton flags.
	 * Note that a SpinCtrl is sometimes defined as a TextCtrl, and so the
	 * flags shouldn't overlap with TextCtrl flags that can be used for a single
	 * line controls (currently we reuse TE_CHARWRAP and TE_RICH2 neither of
	 * which makes sense for them).
	 */
	public static var SP_HORIZONTAL       = HORIZONTAL; /*  4 */
	public static var SP_VERTICAL         = VERTICAL;   /*  8 */
	public static var SP_ARROW_KEYS       = 0x4000;
	public static var SP_WRAP             = 0x8000;

	/*
	 * TabCtrl flags
	 */
	public static var TC_RIGHTJUSTIFY     = 0x0010;
	public static var TC_FIXEDWIDTH       = 0x0020;
	public static var TC_TOP              = 0x0000;    /*  default */
	public static var TC_LEFT             = 0x0020;
	public static var TC_RIGHT            = 0x0040;
	public static var TC_BOTTOM           = 0x0080;
	public static var TC_MULTILINE        = 0x0200;    /* == NB_MULTILINE */
	public static var TC_OWNERDRAW        = 0x0400;
}