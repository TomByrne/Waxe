Building on mac:
Download + extract wxMac-2.8.10.tar.gz

./configure --enable-monolithic --disable-shared --enable-webkit --with-opengl CXXFLAGS=-fvisibility=hidden OBJCXXFLAGS=-fvisibility=hidden OBJCFLAGS=-fvisibility=hidden

copy libwx_mac-2.8.a

copy lib/wx/include/mac-ansi-release-static-2.8/wx/setup.h mac_setup.h

create wx/setup.h to point to the mac_setup.h


