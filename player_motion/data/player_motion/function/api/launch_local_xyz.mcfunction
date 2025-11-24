#> player_motion:api/launch_local_xyz
##
# Launches the player in the input direction relative to the current rotation context
#
# Does not support players in spectator mode nor mounted players
#
# @score $x player_motion.api.launch - Local X (sideways) velocity to launch with
# @score $y player_motion.api.launch - Local Y (vertical) velocity to launch with
# @score $z player_motion.api.launch - Local Z (forward) velocity to launch with
#
# @returns (0 | 1) - `0` if no motion was applied, `1` if motion was applied
##

### Initialize
    ## If all input components are zero, return `0` to indicate no motion was applied
    execute \
        if score $x player_motion.api.launch matches 0 \
        if score $y player_motion.api.launch matches 0 \
        if score $z player_motion.api.launch matches 0 \
        run return 0

    ## Store local launch vector into internal dummy scores from input scores
    scoreboard players operation $x player_motion.internal.dummy = $x player_motion.api.launch
    scoreboard players operation $y player_motion.internal.dummy = $y player_motion.api.launch
    scoreboard players operation $z player_motion.internal.dummy = $z player_motion.api.launch
###

## If the player viewport angle is the same as the context angle, skip rotation calculation & launch
execute positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.00001] run \
    return run function player_motion:internal/launch/local_immediate

### Else, proceed with rotation calculation
    ## Store local launch vector into matrix x/y/z storage from $x/$y/$z scores
    execute store result storage player_motion:internal/temp matrix.x double 1 run \
        scoreboard players get $x player_motion.internal.dummy
    execute store result storage player_motion:internal/temp matrix.y double 1 run \
        scoreboard players get $y player_motion.internal.dummy
    execute store result storage player_motion:internal/temp matrix.z double 1 run \
        scoreboard players get $z player_motion.internal.dummy

    ## Convert local-to-context launch vector to global launch vector via dummy marker entity, stores directly back into `matrix` x/y/z storage & internal $x/$y/$z scores
    execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function player_motion:internal/math/local_to_global with storage player_motion:internal/temp matrix

    ## If the player is looking directly along the polar axis, handle as a special case to avoid gimbal lock issues
    execute if entity @s[x_rotation=-90] run return run function player_motion:internal/launch/handle_polar

    ## Continue like `launch_global_xyz` from here

    ## Get magnitude 1 left/up/forward local-to-player vectors into vec_i/vec_j/vec_k using dummy marker entity
    execute rotated as @s as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function player_motion:internal/math/global/store_reference_vectors

    ##
    # `if (((|x|) > 12398) || ((|y|) > 12398) || ((|z|) > 12398)) large_global_to_local() else global_to_local()`
    # 
    # Use no-tp scoreboard math approximation for global-to-local conversion if all input components are smaller than 12398.
    ##
    scoreboard players set $temp player_motion.internal.dummy 0
    execute if predicate player_motion:internal/large_global \
        as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 \
        store result score $temp player_motion.internal.dummy run \
        function player_motion:internal/math/global/convert_large_to_local
    execute if score $temp player_motion.internal.dummy matches 0 run \
        function player_motion:internal/math/global/convert_to_local

    ## Launch with local launch vector stored in modified internal $x/$y/$z scores, return `1` to indicate motion was applied
    return run function player_motion:internal/launch/main
###