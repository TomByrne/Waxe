Building on mac:
Download + extract wxMac-2.8.10.tar.gz

./configure --enable-monolithic --disable-shared --enable-webkit --with-opengl CXXFLAGS=-fvisibility=hidden OBJCXXFLAGS=-fvisibility=hidden OBJCFLAGS=-fvisibility=hidden

copy libwx_mac-2.8.a

copy lib/wx/include/mac-ansi-release-static-2.8/wx/setup.h mac_setup.h

create wx/setup.h to point to the mac_setup.h


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
