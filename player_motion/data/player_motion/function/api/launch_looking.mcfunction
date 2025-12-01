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
    execute store result score #x player_motion.internal.dummy run scoreboard players set #y player_motion.internal.dummy 0
###

### Convert
    ## Backup the sign of $strength and store the absolute value of $strength into the conversion & conversion index scores
    execute store result score #bucket_index player_motion.internal.dummy run \
        scoreboard players operation #crystal player_motion.internal.dummy = $strength player_motion.api.launch
    scoreboard players set #sign player_motion.internal.dummy 1
    execute if score #crystal player_motion.internal.dummy matches ..-1 run scoreboard players set #sign player_motion.internal.dummy -1
    execute if score #crystal player_motion.internal.dummy matches ..-1 \ 
        store result score #bucket_index player_motion.internal.dummy run \
        scoreboard players operation #crystal player_motion.internal.dummy *= #sign player_motion.internal.dummy

    ## Calculate conversion index from strength ((strength - 1) / 2000)
    scoreboard players remove #bucket_index player_motion.internal.dummy 1
    execute store result storage player_motion:internal/temp convert.index int 1 run \
        scoreboard players operation #bucket_index player_motion.internal.dummy /= #constant.2000 player_motion.internal.const

    ## Run conversion of strength input (crystal-tuned) to approximately equivalent `apply_impulse` method z component, bucket function restores sign, store in #z & matrix.z
    execute store result score #z player_motion.internal.dummy store result storage player_motion:internal/temp matrix.z double 1 run \
        function player_motion:internal/convert_from_legacy/index with storage player_motion:internal/temp convert
###

### `launch_local_xyz` flow

    ### If the player viewport angle is the same as the context angle, skip rotation calculation
        ## Test context against player
        scoreboard players set #equal_context player_motion.internal.dummy 0
        execute positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.00001] run \
            scoreboard players set #equal_context player_motion.internal.dummy 1
        ## If the player is not looking directly along the polar axis, launch normally, pass the return value of `1` to indicate motion was applied
        execute if score #equal_context player_motion.internal.dummy matches 1 \
            unless entity @s[x_rotation=-90] run return run function player_motion:internal/launch/main
        ## Else, mitigate mojank's broken rotation math, pass the return value of `1` to indicate motion was applied
        execute if score #equal_context player_motion.internal.dummy matches 1 \
            run return run function player_motion:internal/launch/handle_polar/local
    ###

    ## Else, proceed with rotation Matrix x/y/z are already set from above, so skip that step

    ## Convert local-to-context launch vector to global launch vector via dummy marker entity, stores directly back into `matrix` x/y/z storage &#x/#y/#z scores
    execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function player_motion:internal/math/local_to_global with storage player_motion:internal/temp matrix

    ## Continue like `launch_global_xyz` from here

    ## If the player is looking directly along the polar axis, handle as a special case to mitigate mojank's broken rotation math
    execute if entity @s[x_rotation=-90] run return run function player_motion:internal/launch/handle_polar/global

    ## Get magnitude 1 left/up/forward local-to-player vectors into vec_i/vec_j/vec_k using dummy marker entity
    execute rotated as @s as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
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

    ## If the previous launch method was also legacy looking and the same vec_k was used, reuse the previous local launch vector to save computation
    execute if score @s player_motion.internal.previous_method matches 2 \
        if score @s player_motion.internal.previous_vec_k = #vec_k_combined player_motion.internal.dummy \
        if score @s player_motion.internal.previous_z.in = $z player_motion.api.launch \
        run return run function player_motion:internal/launch/use_previous

    ## Store current vec_k combined value and launch method into player scores for potential reuse on next launch
    scoreboard players operation @s player_motion.internal.previous_vec_k = #vec_k_combined player_motion.internal.dummy
    scoreboard players set @s player_motion.internal.previous_method 2

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

    ## Store input launch vector into `previous_z.in` for potential reuse on next launch
    scoreboard players operation @s player_motion.internal.previous_z.in = $z player_motion.api.launch
    
    ## Store the local launch vector into `previous_x`/`previous_y`/`previous_z` for potential reuse on next launch
    scoreboard players operation @s player_motion.internal.previous_x = #x player_motion.internal.dummy
    scoreboard players operation @s player_motion.internal.previous_y = #y player_motion.internal.dummy
    scoreboard players operation @s player_motion.internal.previous_z = #z player_motion.internal.dummy

    ## Launch with local launch vector stored in modified #x/#y/#z scores
    function player_motion:internal/launch/main
###