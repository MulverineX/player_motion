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
    execute store result score #x player_motion.internal.dummy \
            store result score #y player_motion.internal.dummy run \
        scoreboard players set #z player_motion.internal.dummy 0
    data modify storage player_motion:internal/temp matrix set value {x: 0.0d, y: 0.0d, z: 0.0d}
###

### Convert
    ## Run approximate conversion of input vector (crystal-tuned) to approximately equivalent `apply_impulse` method vector, store in #x/#y/#z scores & `matrix` storage
    execute unless score $x player_motion.api.launch matches 0 run \
        function player_motion:internal/convert_from_legacy/entry/x
    execute unless score $y player_motion.api.launch matches 0 run \
        function player_motion:internal/convert_from_legacy/entry/y
    execute unless score $z player_motion.api.launch matches 0 run \
        function player_motion:internal/convert_from_legacy/entry/z
###

### `launch_global_xyz` flow
    ## If the player is looking directly along the polar axis, handle as a special case to mitigate mojank's broken rotation math
    execute if entity @s[x_rotation=-90] run return run function player_motion:internal/launch/handle_polar/global

    ## Get magnitude 1 left/up/forward local-to-player vectors into `matrix` `vec_i`/`vec_j`/`vec_k` using dummy marker entity
    execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function player_motion:internal/math/global/store_reference_vectors

    ## Combine vec_k components into a single scoreboard value for comparison
    execute store result score #vec_k_combined player_motion.internal.dummy run \
        data get storage player_motion:internal/temp vec_k[0] 10000
    execute store result score #temp1 player_motion.internal.dummy run \
        data get storage player_motion:internal/temp vec_k[1] 10000
    execute store result score #temp2 player_motion.internal.dummy run \
        data get storage player_motion:internal/temp vec_k[2] 10000
    scoreboard players operation #vec_k_combined player_motion.internal.dummy += #temp1 player_motion.internal.dummy
    scoreboard players operation #vec_k_combined player_motion.internal.dummy += #temp2 player_motion.internal.dummy

    ## If the previous launch method was also legacy xyz and the same vec_k was used, reuse the previous local launch vector to save computation
    execute if score @s player_motion.internal.previous_method matches 3 \
        if score @s player_motion.internal.previous_vec_k = #vec_k_combined player_motion.internal.dummy \
        if score @s player_motion.internal.previous_x.in = $x player_motion.api.launch \
        if score @s player_motion.internal.previous_y.in = $y player_motion.api.launch \
        if score @s player_motion.internal.previous_z.in = $z player_motion.api.launch \
        run return run function player_motion:internal/launch/use_previous

    ## Store current vec_k combined value and launch method into player scores for potential reuse on next launch
    scoreboard players operation @s player_motion.internal.previous_vec_k = #vec_k_combined player_motion.internal.dummy
    scoreboard players set @s player_motion.internal.previous_method 3

    ##
    # `if (((|x|) > 12398) || ((|y|) > 12398) || ((|z|) > 12398)) large_global_to_local() else global_to_local()`
    # 
    # Use no-tp scoreboard math approximation for global-to-local conversion if all input components are smaller than 12398.
    ##
    scoreboard players set #temp player_motion.internal.dummy 0
    execute if predicate player_motion:internal/large_global \
        as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 \
        store result score #temp player_motion.internal.dummy run \
        function player_motion:internal/math/global/convert_large_to_local
    execute if score #temp player_motion.internal.dummy matches 0 run \
        function player_motion:internal/math/global/convert_to_local

    ## Store input launch vector into `previous_x.in`/`previous_y.in`/`previous_z.in` for potential reuse on next launch
    scoreboard players operation @s player_motion.internal.previous_x.in = $x player_motion.api.launch
    scoreboard players operation @s player_motion.internal.previous_y.in = $y player_motion.api.launch
    scoreboard players operation @s player_motion.internal.previous_z.in = $z player_motion.api.launch
    
    ## Store the local launch vector into `previous_x`/`previous_y`/`previous_z` for potential reuse on next launch
    scoreboard players operation @s player_motion.internal.previous_x = #x player_motion.internal.dummy
    scoreboard players operation @s player_motion.internal.previous_y = #y player_motion.internal.dummy
    scoreboard players operation @s player_motion.internal.previous_z = #z player_motion.internal.dummy

    ## Launch with local launch vector stored in modified #x/#y/#z scores
    function player_motion:internal/launch/main
###