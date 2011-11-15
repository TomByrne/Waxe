#ifdef HX_MACOS

#include "../mac_setup.h"

#elif defined(HX_WINDOWS)

#include "../windows_setup.h"

#elif defined(HX_LINUX)

#include "../linux_setup.h"

#else

#error "Unknown haxe compile type"

#endif
