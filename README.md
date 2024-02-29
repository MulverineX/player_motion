# Player Motion
Player Motion is an explosion-based library that uses subtick timing to ensure that only one player is pushed by the blast without any side effects.

## How to use

### Launching a player where in a specific direction

```mcfunction
scoreboard players set $strength player_motion.api.launch 10000
function player_motion:api/launch_looking
```
- `$strength` represents motion in blocks/tick, scaled by 10000. A strength of 10000 will push the player at 1 block/tick
- The facing direction in which the function is called is the direction the player will be launched
- Only the player executing the command will receive a motion update

### Launching a player with xyz vector

```mcfunction
scoreboard players set $x player_motion.api.launch 500
scoreboard players set $y player_motion.api.launch 12000
scoreboard players set $z player_motion.api.launch -3125
function player_motion:api/launch_xyz
```
- `$x`, `$y`, and `$z` are the strength in blocks/tick to launch the player in the x, y, and z directions
- As before, only the player executing the command will be launched

*Note: These functions are *additive* and will apply motion in addition to existing motion rather than directly setting it to whatever input you send 

### Launching player via creeper directly
If you'd like more fine-grain control, you can summon the creepers yourself and simply use delta for the subticking with the following format:
```mcfunction
function player_motion:internal/subtick/begin_launch_context
execute summon creeper positioned <x y+1000 z> run function player_motion:internal/summon/initialize_creepers
scoreboard players operation $temp player_motion.internal.id = @s player_motion.internal.id
function player_motion:internal/subtick/end_launch_context
```
*Note: Creepers with an `ExplosionRadius` of -1 are recommended for more powerful pushes, and 1 for weaker ones. The direction of the push is determined by the angle from the creeper's feet to the player's eyes. You can place as many summon commands as you want, as long as they are between the launch context functions, which **must** be ran from a player. Make sure to summon the creeper 1000 blocks *above* where you want it to spawn.
*Note #2: these instructions are probably out of date because of the no resource pack update, TODO*

## Limitations + Known Issues

While this library is likely the closest we've gotten to perfect player motion manipulation, there are some limitations worth mentioning:
- **MSPT Inconsistency**: Even though the motion applied is constant, the rate at which the server and client update may vary, and calling motion updates per tick may result in inconsistencies when these variations become too large. For consistent results, Delta should only be used for instantaneous bursts of motion, and continuous forces should instead rely on riding-based methods or levitation, depending on the context.
- **Spigot/Paper**: ~~This pack uses negative explosion radius creepers, which do not affect player motion on spigot or paper servers.~~ To make this pack work on paper, Nico314159 has made a fix here: https://github.com/Nico314159/Paper-Negative-Explosions

If you know any possible solutions or would like to help fixing these problems, please let me know!
