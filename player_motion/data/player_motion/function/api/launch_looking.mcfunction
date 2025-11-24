#> player_motion:api/launch_looking
##
# @deprecated - Converts from a legacy end crystal explosion tuned launch strength into a `apply_impulse` launch vector. The conversion is approximate and slower than using `launch_local_xyz` directly.
#
# Launches the player backward or forward along the current rotation context
#
# Does not support players in spectator mode
#
# @score $strength player_motion.api.launch (-64000..64000) - Approximate local Z velocity to launch with
##

### Initialize
    ## If the player is riding a vehicle, fail the launch, new API requires unmounted players before launching
    execute on vehicle run return fail

    ## If strength is zero, return early
    execute if score $strength player_motion.api.launch matches 0 run return 0

    ## Zero out x & y components for local launch vector
    data modify storage player_motion:internal/temp matrix set value {x: 0.0d, y: 0.0d}
    execute store result score $x player_motion.internal.dummy run scoreboard players set $y player_motion.internal.dummy 0
###

### Convert
    ## Backup the sign of $strength and store the absolute value of $strength into the conversion & conversion index scores
    execute store result score $bucket_index player_motion.internal.dummy run \
        scoreboard players operation $crystal player_motion.internal.dummy = $strength player_motion.api.launch
    scoreboard players set $sign player_motion.internal.dummy 1
    execute if score $crystal player_motion.internal.dummy matches ..-1 run scoreboard players set $sign player_motion.internal.dummy -1
    execute if score $crystal player_motion.internal.dummy matches ..-1 \ 
        store result score $bucket_index player_motion.internal.dummy run \
        scoreboard players operation $crystal player_motion.internal.dummy *= $sign player_motion.internal.dummy

    ## Calculate conversion index from strength ((strength - 1) / 2000)
    scoreboard players remove $bucket_index player_motion.internal.dummy 1
    execute store result storage player_motion:internal/temp convert.index int 1 run \
        scoreboard players operation $bucket_index player_motion.internal.dummy /= $constant.2000 player_motion.internal.const

    ## Run conversion of strength input (crystal-tuned) to approximately equivalent `apply_impulse` method z component, bucket function restores sign, store in $z & matrix.z
    execute store result score $z player_motion.internal.dummy store result storage player_motion:internal/temp matrix.z double 1 run \
        function player_motion:internal/convert_from_legacy/index with storage player_motion:internal/temp convert
###

### `launch_local_xyz` flow

    ## If the player viewport angle is the same as the context angle, skip rotation calculation and launch
    execute positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.00001] run \
        return run function player_motion:internal/launch/local_immediate

    ## Else, proceed with rotation Matrix x/y/z are already set from above, so skip that step

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

    ## Launch with local launch vector stored in modified internal $x/$y/$z scores
    function player_motion:internal/launch/main
###