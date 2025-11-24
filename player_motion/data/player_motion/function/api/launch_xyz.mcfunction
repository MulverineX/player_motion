#> player_motion:api/launch_xyz
##
# @deprecated - Converts from a legacy end crystal explosion tuned launch vector into a `apply_impulse` launch vector. The conversion is approximate and slower than using `launch_global_xyz` directly.
#
# Launches the player in the input direction
#
# Must be executed `at` the player
#
# Does not support players in spectator mode
#
# @score $x player_motion.api.launch (-64000..64000) - Approximate global X velocity to launch with
# @score $y player_motion.api.launch (-64000..64000) - Approximate global Y velocity to launch with
# @score $z player_motion.api.launch (-64000..64000) - Approximate global Z velocity to launch with
##

### Initialize
    ## If the player is riding a vehicle, fail the launch, new API requires unmounted players before launching
    execute on vehicle run return fail

    ## If all input components are zero, return early
    execute \
        if score $x player_motion.api.launch matches 0 \
        if score $y player_motion.api.launch matches 0 \
        if score $z player_motion.api.launch matches 0 \
        run return 0

    ## Internal launch vector storage & scores
    execute store result score $x player_motion.internal.dummy \
            store result score $y player_motion.internal.dummy run \
        scoreboard players set $z player_motion.internal.dummy 0
    data modify storage player_motion:internal/temp matrix set value {x: 0.0d, y: 0.0d, z: 0.0d}
###

### Convert
    ## Run approximate conversion of input vector (crystal-tuned) to approximately equivalent `apply_impulse` method vector, store in internal x/y/z scores & `matrix` storage
    execute unless score $x player_motion.api.launch matches 0 run \
        function player_motion:internal/convert_from_legacy/entry/x
    execute unless score $y player_motion.api.launch matches 0 run \
        function player_motion:internal/convert_from_legacy/entry/y
    execute unless score $z player_motion.api.launch matches 0 run \
        function player_motion:internal/convert_from_legacy/entry/z
###

### `launch_global_xyz` flow
    ## If the player is looking directly along the polar axis, handle as a special case to avoid gimbal lock issues
    execute if entity @s[x_rotation=-90] run return run function player_motion:internal/launch/handle_polar

    ## Get magnitude 1 left/up/forward local-to-player vectors into `matrix` `vec_i`/`vec_j`/`vec_k` using dummy marker entity
    execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
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