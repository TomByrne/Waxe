Getting started on mac ...

Download + extract wxWidgets 2.9.2.
Put this "next to" the waxe root, or set the WXROOT variable appropriately

Configure + build static libraries:
./configure --enable-monolithic --disable-shared --enable-webkit --with-opengl CXXFLAGS=-fvisibility=hidden OBJCXXFLAGS=-fvisibility=hidden OBJCFLAGS=-fvisibility=hidden
make

I copied the resulting setup to the waxe svn:
cp lib/wx/include/osx_carbon-unicode-static-2.9/wx/setup.h ../waxe/src/include/mac_setup.h


Linux, simiar procedure - it is not possible to cross-compile to 32 bits

edit the configure script and remove the opengl libraray check

./configure  --disable-shared --with-opengl CC="cc -m32" CXX="g++ -m32" --build=i486-pc-linux-gnu --with-x11 --without-gtk --enable-monolithic

Then hand edit the resulting setup:
lib/wx/include/x11univ-unicode-static-2.9/wx/setup.h
and set:
(not sure if this is required now)
#define wxUSE_THEME_GTK     1


make

cp ../../wxWidgets-2.9.2/lib/wx/include/x11univ-unicode-static-2.9/wx/setup.h  include/linux_setup.h 



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
