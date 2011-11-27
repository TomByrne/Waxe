#ifdef HX_MACOS

#include "../mac_setup.h"

#elif defined(HX_WINDOWS)

#include "../windows_setup.h"

#elif defined(HX_LINUX)

  #ifdef HXCPP_M64
  #include "../linux64_setup.h"
  #else
  #include "../linux_setup.h"
  #endif

#else

#error "Unknown haxe compile type"

#endif
