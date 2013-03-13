call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86

cd ../../wxwidgets/build/msw
nmake -f makefile.vc

cd ../../../Waxe/src
haxelib run hxcpp Build.xml

pause