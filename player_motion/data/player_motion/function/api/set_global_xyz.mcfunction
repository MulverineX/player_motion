#> player_motion:api/launch_global_xyz
##
# Launches the player in the input direction
#
# Must be executed `at` the player
#
# Does not support players in spectator mode nor mounted players
#
# @score $x player_motion.api.launch - Global X velocity to launch with
# @score $y player_motion.api.launch - Global Y velocity to launch with
# @score $z player_motion.api.launch - Global Z velocity to launch with
#
# @returns (0 | 1) - `0` if no motion was applied, `1` if motion was applied
##

### Initialize
    ## If the player is riding a vehicle, fail the launch, new API requires unmounted players before launching
    execute on vehicle run return fail

### Maths
    # Get current velocity
    execute store result score $cx player_motion.internal.math run data get entity @s Motion[0] 10000
    execute store result score $cy player_motion.internal.math run data get entity @s Motion[1] 10000
    execute store result score $cz player_motion.internal.math run data get entity @s Motion[2] 10000
    # Save Target Velcoity
    scoreboard players operation $x player_motion.internal.math = $x player_motion.api.set
    scoreboard players operation $y player_motion.internal.math = $y player_motion.api.set
    scoreboard players operation $z player_motion.internal.math = $z player_motion.api.set
    # Save previous launch velocity
    scoreboard players operation $lx player_motion.api.set = $x player_motion.api.launch
    scoreboard players operation $ly player_motion.api.set = $y player_motion.api.launch
    scoreboard players operation $lz player_motion.api.set = $z player_motion.api.launch
    # Calculate Required Velocity Change
    execute store result score $x player_motion.api.launch run scoreboard players operation $x player_motion.internal.math -= $cx player_motion.internal.math
    execute store result score $y player_motion.api.launch run scoreboard players operation $y player_motion.internal.math -= $cy player_motion.internal.math
    execute store result score $z player_motion.api.launch run scoreboard players operation $z player_motion.internal.math -= $cz player_motion.internal.math
    # Cleanup
    scoreboard players reset $cx player_motion.internal.math
    scoreboard players reset $cy player_motion.internal.math
    scoreboard players reset $cz player_motion.internal.math
    scoreboard players reset $x player_motion.internal.math
    scoreboard players reset $y player_motion.internal.math
    scoreboard players reset $z player_motion.internal.math

# Call launch function in API
    execute store result score #r player_motion.api.set run function player_motion:api/launch_global_xyz
    scoreboard players operation $x player_motion.api.launch = $lx player_motion.api.set
    scoreboard players operation $y player_motion.api.launch = $ly player_motion.api.set
    scoreboard players operation $z player_motion.api.launch = $lz player_motion.api.set
    return run scoreboard players get #r player_motion.api.set

