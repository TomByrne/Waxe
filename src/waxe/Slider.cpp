#include "HaxeAPI.h"

	//wxWindow* parent, wxWindowID id, int value , int minValue, int maxValue, const wxPoint& point = wxDefaultPosition, const wxSize& size = wxDefaultSize, long style = wxSL_HORIZONTAL, const wxValidator& validator = wxDefaultValidator, const wxString& name = "slider"
value wx_slider_create(value inParams)
{
	wxWindow* parent;
	ValueToWX(val_array_i(inParams,0),parent);
	wxWindowID id = Val2Int(val_array_i(inParams,1),wxID_ANY);
	int value = val_int(val_array_i(inParams,2));
	int minValue = val_int(val_array_i(inParams,3));
	int maxValue = val_int(val_array_i(inParams,4));
   	wxPoint position = Val2Point(val_array_i(inParams,5));
   	wxSize size = Val2Size(val_array_i(inParams,6));
	long style = val_int(val_array_i(inParams,7));

	 wxSlider *window = new wxSlider(parent,id,value, minValue, maxValue,
	 									  position,size,style);

    return WXToValue(window);
}
DEFINE_PRIM(wx_slider_create,1)



value wx_slider_set_value(value inWindow, value state) 
{ 
	wxSlider *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	window->SetValue(Val2Int(state)); 
	return alloc_null();
} 
DEFINE_PRIM(wx_slider_set_value,2);


value wx_slider_get_value(value inWindow) 
{ 
	wxSlider *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return WXToValue(window->GetValue());
} 
DEFINE_PRIM(wx_slider_get_value,1);



value wx_slider_set_range(value inWindow, value minValue, value maxValue) 
{ 
	wxSlider *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	window->SetRange(Val2Int(minValue), Val2Int(maxValue)); 
	return alloc_null();
} 
DEFINE_PRIM(wx_slider_set_range,3);


value wx_slider_get_min(value inWindow) 
{ 
	wxSlider *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return WXToValue(window->GetMin());
} 
DEFINE_PRIM(wx_slider_get_min,1);


value wx_slider_get_max(value inWindow) 
{ 
	wxSlider *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return WXToValue(window->GetMax());
} 
DEFINE_PRIM(wx_slider_get_max,1);