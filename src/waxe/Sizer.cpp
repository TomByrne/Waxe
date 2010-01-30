#include <HaxeAPI.h>
#include <wx/gbsizer.h>


wxSizer *Val2Sizer(value inVal)
{
	if (val_is_null(inVal))
		return 0;

	wxSizer *sizer;
	ValueToWX(inVal,sizer);
	return sizer;
}


value wx_sizer_create_box(value inVertical)
{
	wxSizer *sizer =  new wxBoxSizer( val_bool(inVertical) ? wxVERTICAL : wxHORIZONTAL );
	return WXToValue(sizer);
}
DEFINE_PRIM(wx_sizer_create_box,1)

value wx_sizer_create_grid(value rows,value cols, value vgap, value hgap)
{
	if (val_is_null(rows))
	  return WXToValue(new wxGridSizer(val_int(cols),val_int(vgap),val_int(hgap)));
	return WXToValue(new wxGridSizer(val_int(rows),val_int(cols),val_int(vgap),val_int(hgap)));
}
DEFINE_PRIM(wx_sizer_create_grid,4)

value wx_sizer_create_flex_grid(value rows,value cols, value vgap, value hgap)
{
	if (val_is_null(rows))
	  return WXToValue(new wxFlexGridSizer(val_int(cols),val_int(vgap),val_int(hgap)));
	return WXToValue(new wxFlexGridSizer(val_int(rows),val_int(cols),val_int(vgap),val_int(hgap)));
}
DEFINE_PRIM(wx_sizer_create_flex_grid,4)

value wx_sizer_create_grid_bag(value vgap, value hgap)
{
	return WXToValue(new wxGridBagSizer(val_int(vgap),val_int(hgap)));
}
DEFINE_PRIM(wx_sizer_create_grid_bag,2)




value wx_sizer_add(value inHandle,value inSizerOrWindow, value inProportion, value inFlags,value inBorder)
{
	wxSizer *parent;
	if (ValueToWX(inHandle,parent))
	{
		int prop = val_int(inProportion);
		int flags = val_int(inFlags);
		int border = val_int(inBorder);

		wxSizer *sizer;
		wxWindow *window;
		if (ValueToWX(inSizerOrWindow,sizer))
		{
			parent->Add(sizer,prop,flags,border);
		}
		else if (ValueToWX(inSizerOrWindow,window))
		{
			parent->Add(window,prop,flags,border);
		}
		else
			val_throw(alloc_string("Invalid Sizer Child"));
	}
	return alloc_null();
}
DEFINE_PRIM(wx_sizer_add,5)


value wx_sizer_add_growable_row(value inHandle,value inRow, value inProportion)
{
	wxFlexGridSizer *sizer;
	if (ValueToWX(inHandle,sizer))
		sizer->AddGrowableRow(val_int(inRow),val_int(inProportion));

	return alloc_null();
}
DEFINE_PRIM(wx_sizer_add_growable_row,3)

value wx_sizer_add_growable_col(value inHandle,value inCol, value inProportion)
{
	wxFlexGridSizer *sizer;
	if (ValueToWX(inHandle,sizer))
		sizer->AddGrowableCol(val_int(inCol),val_int(inProportion));

	return alloc_null();
}
DEFINE_PRIM(wx_sizer_add_growable_col,3)
