# Notice: This version of the library is no longer officially maintained, PRs will be accepted, and if anyone wants to have direct commit access, ping me on MCC
Those who want to make maps compatible with Realms must attempt to use this version until mojang does something about """experimental""" features. No support is available in our Issues or Discord thread for this version of the library unless it is being used for a version prior to Minecraft 1.21.11. 

## Player Motion

Player Motion is an explosion-based library that uses subtick timing to ensure that only one player is pushed by the blast without any side effects.

Credit to [@BigPapi13](https://github.com/BigPapi13/Delta) for making the original library this is inspired by. This project aims to succeed it.

Credit to `nedraw` from the minecraft commands discord for the ender crystal methodology & implementation this is now based on.

Credit to [@SuperSwordTW](https://github.com/SuperSwordTW) for helping make significant math performance & stability improvements.

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

## Limitations + Known Issues

While this library is likely the closest we've gotten to perfect player motion manipulation, there are some limitations worth mentioning:
- **MSPT Inconsistency**: Even though the motion applied is constant, the rate at which the server and client update may vary, and calling motion updates per tick may result in inconsistencies when these variations become too large. For consistent results, the library should only be used for instantaneous bursts of motion, and continuous forces should instead rely on riding-based methods or levitation, depending on the context.

If you know any possible solutions or would like to help fixing these problems, please let me know!
