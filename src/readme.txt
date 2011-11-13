Getting started on mac ...

Download + extract wxWidgets 2.9.2.
Put this "next to" the waxe root, or set the WXROOT variable appropriately

Configure + build static libraries:
./configure --enable-monolithic --disable-shared --enable-webkit --with-opengl CXXFLAGS=-fvisibility=hidden OBJCXXFLAGS=-fvisibility=hidden OBJCFLAGS=-fvisibility=hidden
make

I copied the resulting setup to the waxe svn:
cp lib/wx/include/osx_carbon-unicode-static-2.9/wx/setup.h ../waxe/src/include/mac_setup.h






Building on Windows:
Download + extract wxMSW-2.8.10.tar.gz
 edit Config.vc:
     BUILD = release
	  MONOLITHIC = 1
	  USE_OPENGL = 1
	  RUNTIME_LIBS = static

nmake -f makefile.vc

cp lib/vc_lib/*.h
cp lib/vc_lib/msw/wx/setup.h wx/windows_setup.h
create wx/setup.h to point to the windows_setup.h



---------------------
scintilla

Download & extract wxscintilla_1.69.2
For windows, use the makefile from lib/Windows, pointing wx/include to here.
