// On Windows "SDL_opengl.h" includes <Windows.h> in order to get single define APIENTRY.
// We don't want this, since this slow-downs compilation, so, define APIENTRY manually.
// This prevents "SDL_opengl.h" including <Windows.h>.
#ifdef _WIN32
	#ifdef _STDCALL_SUPPORTED
		#define APIENTRY __stdcall
	#else
		#define APIENTRY
	#endif
#endif

// SDL redefines "main". We don't need this, this "main" definition may conflict with our own "main".
#define SDL_MAIN_HANDLED

#include <SDL.h>

#include "panzer_mortyr_gl.h"
