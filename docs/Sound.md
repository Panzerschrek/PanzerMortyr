### Requirements

PanzerMortyr should have sounds.
This includes game even sounds - shots, enemy shouts, player speech, footstep sounds and many other.
Also this includes ambient sounds, which are attached to map areas and are played in a loop.
Lastly PanzerMortyr should support playing in-game music - from the original CD or from files saved from such CD in a directory.

Game event sounds and (maybe) ambient sounds should use distance-based attenuation, so that sound sources located far away are quieter compared to sources nearby.
Also sounds volume should be calculated for both ears separately (stereo-sound), so that sound sources located at the left are mostly heard in the left ear.

Movements of sound sources should update heard sound positions.
This is important for fast-moving game objects and/or objects emitting sounds with long duration.

For some entities making sounds it may be necessary to stop playing such sound upon entity death.
But this should be decided for each case individually, death sounds should continue playing even if an entity is technically already dead.

It should be considered to use occlusion-based sound volume attenuation, so that sound sources located behind walls are less loud compared to sound sources within plain sight.
But such occlusion-based attenuation should be pretty smooth in order to avoid instant volume change.

Sound volume calculated from frame to frame (or from game logic step to step) should be smoothed while being mixed and outputted.
This is necessary to avoid ugly cracks and steps caused by rapid volume change.
When the game is paused, game sounds should be muted gradually too.

Output sound quality should be as high as possible/viable, with like 44100 Hz sample rate and 16-bit samples by default.
Source samples with frequency less than that should be resampled with linear interpolation.
But there should be a setting allowing reducing sound quality.

Mixing buffer should have at least 16 bits precision or maybe even use "f32".
It should be also considered to apply some sort of smooth clamping/range compressing for samples near the maximum possible value.

Sound latency should be minimized, so that the delay between the player input (like shot button pressing) and the outputted sound (like shot sound) is as small as possible.
This requires shortening buffer sizes to a reasonable minimum.

Ideally, sound playing state should be preserved in save files, so that active sounds continue playing from the position at which they were saved.
This should include game event sounds, ambient sounds and (maybe) in-game music, but should exclude menu sounds and other sounds external for the game logic.


### Architectural aspects

The game logic code shouldn't spawn sound sources directly by calling the sound subsystem.
It's impossible, since game logic may be calculated more than once (for extrapolation) or in case of client-server-based multiplayer game, where calling the sound subsystem on a client's machine isn't possible from the game logic code running on the server.

There can be no information exchange channel leading from the sound subsystem to the game code.
This means, that the game logic code can't know exactly when a particular sound stops playing.
It can't know it, because it's not know exactly how fast sound samples are outputted, it's assumed that a sound with duration like 2.7 seconds should play 2.7 seconds, but it may be slightly less or more depending on system hardware/drivers.
But it's even impossible to know how long sound files are, since it requires loading sound data in game logic code, which should be avoided (especially for the server in multiplayer modes).

Just firing "start playing" events from the game code to the sound subsystem isn't enough.
Active sounds should be updated - at least repositioned and stopped if necessary.

The only remaining approach is to maintain in the game logic code a set of active sound sources and to update playing sounds after each game logic step according to this set.
Each sound source should have some unique identifier to be able to do this.
Such identifiers should not repeat.
Sounds sources shouldn't be generally destroyed, since it's not known, how long it takes to play them, with exception of cases when a source should stop playing.
But maybe some large timeout can be used, which is greater than the duration of any possible sound (like ~1 minute for non-ambient sounds).

How exactly active sources should be stored in the game state structure isn't for now clear.
It may be some sort of a ring buffer (with too-old sounds overwritten with new ones).
But it may be something more complex, like a fixed set of sound sources per-entity.
In any case this set of sources shouldn't take a lot of space and take too much time to process, it also should be designed in such a way so that the chance of stopping a sound which still should be played is minimal.


### Technical considerations of sound-related code

To achieve smooth sound playing, a dedicated thread with higher than average priority should perform actual sound mixing and outputting.
It's not hard to achieve this, since this is the default way SDL2 works with sound outputting.

This sound-mixing thread should be treated as a realtime thread with corresponding measures achieving this requirement.
The amount of work performed by it should be limited (no more than N active samples to mix).
No blocking operations are allowed, which includes blocking synchronization primitives (but not atomic variables), any system calls, logging or even heap memory allocation.

The prohibition of blocking synchronization primitives means, that some non-blocking mechanisms should be used for the communication between the sound thread and the main thread.
At least one-way communication is necessary - to provide sounds to play and to update them.
But the backward communication channel may be also necessary - in order to save sound playing state in a save file.
The obvious way of such communication is to use some sort of single producer/single consumer queue.


### Sounds loading

It's fine to perform sounds loading on the main thread, but only in loading phases.
All sounds needed for a specific level should be loaded at entering this level and should be read from the memory later.
It's needed to avoid frame drops if the file for a requested sound isn't loaded yet.

The sound mixing thread should receive loaded sound samples from the main thread, using "shared_ptr_mt_final", for example.

It's not a huge problem to load all sound files from the game archive (or at least used ones) at once.
But maybe it's not necessary and less memory may be used instead by only loading sounds needed for the current level (but this requires further investigation).
If the approach with loading of only necessary files is chosen, sounds shouldn't be reloaded upon level transition, if a particular file is used both in the previous and in the new level.
