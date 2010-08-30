#include <HaxeAPI.h>
#include "clay/Layout.h"

using namespace clay;

value wx_clay_man_create(value inFrame, value inOwner)
{
   wxFrame *frame;
   if (! ValueToWX(inFrame,frame) )
      return alloc_null();

   Manager *manager = new Manager(frame);

   manager->mData.SetClientObject( new HaxeData(inOwner) );

   return WXToValue(manager);
}

DEFINE_PRIM(wx_clay_man_create,2)



value wx_clay_man_init_root_container(value inManager, value inOwner)
{
   Manager *manager;
   if (! ValueToWX(inManager,manager) )
      return alloc_null();

   manager->GetRootContainer()->mData.SetClientObject( new HaxeData(inOwner) );
   return WXToValue(manager->GetRootContainer());
}
DEFINE_PRIM(wx_clay_man_init_root_container,2)


value wx_clay_man_get_root(value inManager)
{
   Manager *manager;
   if (! ValueToWX(inManager,manager) )
      return alloc_null();

   return dynamic_cast<HaxeData *>(manager->GetRootContainer()->mData.GetClientObject())->GetHaxeObject();
}
DEFINE_PRIM(wx_clay_man_get_root,1)


// --- Container ----------------------------------------------


value wx_container_add_window(value *arg, int argc)
{
   enum { aParent, aWindow, aNewContainer, aWhere, aFlags, aAsToolbar, aSIZE };

   Container *parent;
   wxWindow    *window;

   if (! ValueToWX(arg[aParent],parent) )
      return alloc_null();
   
   if (! ValueToWX(arg[aWindow],window) )
      return alloc_null();

   Container *c = parent->Add(window, (AddPosition)val_int(arg[aWhere]), wxIconBundle(),
          val_int(arg[aFlags]), val_bool(arg[aAsToolbar]) ? wsToolbar : wsNormal );

   c->mData.SetClientObject( new HaxeData(arg[aNewContainer]) );
   return WXToValue(c);
}
DEFINE_PRIM_MULT(wx_container_add_window)


value wx_container_get_width(value inContainer, value inWhich)
{
   Container *container;
   if ( ValueToWX(inContainer,container) )
      return alloc_int(container->GetSize((SizeType)val_int(inWhich)).x);
   return alloc_null();
}
DEFINE_PRIM(wx_container_get_width,2)


value wx_container_set_width(value inContainer, value inWhich, value inW)
{
   Container *container;
   if ( ValueToWX(inContainer,container) )
      container->SetWidth(val_int(inW),(SizeType)val_int(inWhich));
   return alloc_null();
}
DEFINE_PRIM(wx_container_set_width,3)


value wx_container_get_height(value inContainer, value inWhich)
{
   Container *container;
   if ( ValueToWX(inContainer,container) )
      return alloc_int(container->GetSize((SizeType)val_int(inWhich)).y);
   return alloc_null();
}
DEFINE_PRIM(wx_container_get_height,2)


value wx_container_set_height(value inContainer, value inWhich, value inW)
{
   Container *container;
   if ( ValueToWX(inContainer,container) )
      container->SetHeight(val_int(inW),(SizeType)val_int(inWhich));
   return alloc_null();
}
DEFINE_PRIM(wx_container_set_height,3)





