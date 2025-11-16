# Player Motion
Player Motion is an enchantment effect-based library that triggers `apply_impulse` with a swap into spectator mode using the saddle slot with no side effects.

Credit to [@BigPapi13](https://github.com/BigPapi13/Delta) for making the original library this is inspired by. This project aims to succeed it.

Credit to `nedraw` from MCC for the ender crystal methodology & implementation this used to use.

Credit to [@SuperSwordTW](https://github.com/SuperSwordTW) for helping make significant math performance & stability improvements.

Credit to `1000hrcelebration` & `mastershroob` from MCC for the method of converting a desired global vector into a local vector.

## How to use

### Launching a player along its local coordinates (`^ ^ ^`)

```mcfunction
# Left/Right
scoreboard players set $x player_motion.api.launch 500
# Above/Below
scoreboard players set $y player_motion.api.launch 12000
# Forward/Backward
scoreboard players set $z player_motion.api.launch -3125

function player_motion:api/launch_local_xyz
```
- `$x`, `$y`, and `$z` are the strength in blocks/tick to launch the player in the local directions. A `$z` of 10000 will push the player forward at 1 block/tick
- Only the player executing the command will receive a motion update

### Launching a player along its relative coordinates (`~ ~ ~`)

```mcfunction
scoreboard players set $x player_motion.api.launch 500
scoreboard players set $y player_motion.api.launch 12000
scoreboard players set $z player_motion.api.launch -3125

function player_motion:api/launch_global_xyz
```
- `$x`, `$y`, and `$z` are the strength in blocks/tick to launch the player in the x, y, and z directions
- As before, only the player executing the command will be launched
- While this will work on entities besides the player, it is recommended to modify their `Motion` nbt directly

*Notes:
- These functions are *additive* and will apply motion in addition to existing motion rather than directly setting it to whatever input you send
- The player cannot be on a mount nor be in spectator mode

## Old Methods
<details>
  <summary>Click to expand</summary>

  ### Launching a player in the direction it is looking

  ```mcfunction
  scoreboard players set $strength player_motion.api.launch 10000
  function player_motion:api/launch_looking
  ```
  - `$strength` represents motion in approximate blocks/tick, scaled by 10000. A strength of 10000 will push the player at about 1 block/tick
  - The facing direction of the player is the direction they will be launched in
  - Only the player executing the command will receive a motion update

  ### Launching a player with xyz vector

  ```mcfunction
  scoreboard players set $x player_motion.api.launch 500
  scoreboard players set $y player_motion.api.launch 12000
  scoreboard players set $z player_motion.api.launch -3125
  function player_motion:api/launch_xyz
  ```
  - `$x`, `$y`, and `$z` are the strength in approximate blocks/tick to launch the player in the x, y, and z directions
  - As before, only the player executing the command will be launched

  *Notes:
  - These functions are *additive* and will apply motion in addition to existing motion rather than directly setting it to whatever input you send
  - These functions provide approximately the same amount of motion as the ender crystal version of the library, to do so they run a conversion internally. It is recommended that those using these functions migrate while adjusting the values used

</details>

## Limitations + Known Issues

While this library is likely the closest we've gotten to perfect player motion manipulation, there are some limitations worth mentioning:
- **MSPT/Ping Inconsistency**: Even though the motion applied is constant, the rate at which the server and client update may vary, and calling motion updates per tick may result in inconsistencies when these variations become too large. For consistent results, the library should be used for instantaneous bursts of motion, and continuous forces should instead rely on riding-based methods or levitation when possible, depending on the context.
- **Realms Incompatibility**: With the `apply_impulse` update to the library, comes incompatibility with Realms. This is due to data-driven enchantments being an "experimental" feature even though there is nothing actually experimental about them.

If you know any possible solutions or would like to help fixing these problems, please let me know!
