#include "HaxeAPI.h"


value wx_controlWithItems_clear(value inWindow) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	window->Clear(); 
	return alloc_null();
} 
DEFINE_PRIM(wx_controlWithItems_clear,1);

value wx_wxControlWithItems_insert(value inWindow,value strInsert,value position) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return  WXToValue(window->Insert(Val2Str(strInsert),Val2Int(position))); 
} 
DEFINE_PRIM(wx_wxControlWithItems_insert,3);


value wx_wxControlWithItems_append(value inWindow,value strInsert) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return  WXToValue(window->Append(Val2Str(strInsert))); 
} 
DEFINE_PRIM(wx_wxControlWithItems_append,2);

value wx_wxControlWithItems_delete(value inWindow,value position) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	window->Delete(Val2Int(position)); 
	return alloc_null();
} 
DEFINE_PRIM(wx_wxControlWithItems_delete,2);


value wx_wxControlWithItems_get_selection(value inWindow) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return WXToValue(window->GetSelection()); 
} 
DEFINE_PRIM(wx_wxControlWithItems_get_selection,1);


value wx_wxControlWithItems_set_selection(value inWindow, value n) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	window->SetSelection(Val2Int(n)); 
	return alloc_null();
} 
DEFINE_PRIM(wx_wxControlWithItems_set_selection,2);


value wx_wxControlWithItems_get_string(value inWindow, value n) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return WXToValue(window->GetString(Val2Int(n)));
} 
DEFINE_PRIM(wx_wxControlWithItems_get_string,2);


value wx_wxControlWithItems_set_string(value inWindow, value n, value string) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	window->SetString(Val2Int(n), Val2Str(string)); 
	return alloc_null();
} 
DEFINE_PRIM(wx_wxControlWithItems_set_string,3);




/*
// cant implement. need to return unsigned int
// maybe need to declare WXToValue (unsigned int)

value wx_wxControlWithItems_getCount(value inWindow) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return  WXToValue(window->GetCount()); 
	
} 
DEFINE_PRIM(wx_wxControlWithItems_getCount,1);
*/


/*
//FindString doesn't return the integer. what's wrong with this function

value wx_wxControlWithItems_FindString(value inWindow,value strSearch,value caseSensitive) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return  WXToValue(window->FindString(Val2Str(strSearch),Val2Bool(caseSensitive))); 
} 
DEFINE_PRIM(wx_wxControlWithItems_FindString,3);


*/