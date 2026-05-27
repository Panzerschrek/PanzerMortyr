// SDL redefines "main". We don't need this, this "main" definition may conflict with our own "main".
#define SDL_MAIN_HANDLED

#include <SDL.h>

#include "panzer_mortyr_gl.h"
