This document describes sky models of the original game.

Sky model = 0
Just black or almost skybox with stars, but without moon and clouds.
It's found experementally, it's not used in the original game.

Sky model = 1
It's a color gradient with given colors from (-X, -Y) to (+X, +Y).
Has clouds scrolling slowly towards (-X, -Y) direction.
Clouds are blended with sky color using multiplicative blending.
Has stars.

Sky model = 2
It's a color gradient with given colors from (-X, -Y) to (+X, +Y).
Has clouds scrolling slowly towards (-X, -Y) direction.
Clouds are blended with sky color using multiplicative blending.
Has a moon.

Sky model = 3
It's a color gradient with given colors from (-X, -Y) to (+X, +Y).
Has clouds scrolling slowly towards (-X, -Y) direction.
Has second clouds layer scrolling faster than the first one.
Clouds are blended with sky color using multiplicative blending.
Two cloud layers are added to each other.
Has a moon.

Specifying sky models above 3 gives the same result as mode 3.

Moon and starts seems to use additive blending.

Sky model 0 is unused.
Sky model 1 is used on maps 4, 16, 23, 29.
Sky model 2 is used on maps 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 20, 21, 24, 25, 28, 31, 32, 33, 34, 35, 37, 38, 39, 40, 41, 42.
Sky model 3 is used on maps 0, 1, 19, 22, 26, 27, 30, 36.
