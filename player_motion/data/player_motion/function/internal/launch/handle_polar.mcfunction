#> handle_polar.mcfunction
## Handle polar axis gimbal lock case (x vertical rotation of `-90` degrees)

## Swap y and z, flip sign of y. If needed, flip sign of x and restore sign of y.
scoreboard players operation $y player_motion.internal.dummy >< $z player_motion.internal.dummy
scoreboard players operation $y player_motion.internal.dummy *= #constant.-1 player_motion.internal.const
execute rotated ~ 0 positioned .5 .0 .0 positioned ^ ^ ^-.5 align xyz facing .0 0 -.5 positioned as @s positioned ^ ^ ^1 if entity @s[dx=0,dy=0,dz=0] run \
    function player_motion:internal/math/polar/flip_xy

### `launch_local_xyz` flow
    ## If the player viewport angle is the same as the context angle, skip rotation calculation and directly run launch
    execute positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.00001] run \
        return run function player_motion:internal/launch/main

    ## Else, proceed with rotation calculation, start by storing local launch vector into matrix x/y/z storage from $x/$y/$z scores
    execute store result storage player_motion:internal/temp matrix.x double 1 run \
        scoreboard players get $x player_motion.internal.dummy
    execute store result storage player_motion:internal/temp matrix.y double 1 run \
        scoreboard players get $y player_motion.internal.dummy
    execute store result storage player_motion:internal/temp matrix.z double 1 run \
        scoreboard players get $z player_motion.internal.dummy

    ## Convert local-to-context launch vector to global launch vector via dummy marker entity, stores directly back into `matrix` x/y/z storage & internal $x/$y/$z scores
    execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function player_motion:internal/math/polar/local_to_global with storage player_motion:internal/temp

    ## Continue like `launch_global_xyz` from here

    ## Store magnitude 1 left/up/forward local-to-player vectors in `matrix` vec_i/vec_j/vec_k using dummy marker entity
    execute rotated as @s as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function player_motion:internal/math/store_reference_vectors

    ##
    # `if (((|x|) > 12398) || ((|y|) > 12398) || ((|z|) > 12398)) large_global_to_local() else global_to_local()`
    # 
    # Use no-tp scoreboard math approximation for global-to-local conversion if all input components are smaller than 12398.
    ##
    scoreboard players set $temp player_motion.internal.dummy 0
    execute if predicate player_motion:internal/large_global \
        as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 \
        store result score $temp player_motion.internal.dummy run \
        function player_motion:internal/math/large_global_to_local
    execute if score $temp player_motion.internal.dummy matches 0 run \
        function player_motion:internal/math/global_to_local

    ## Launch with local launch vector stored in modified internal $x/$y/$z scores, return `1` to indicate motion was applied
    return run function player_motion:internal/launch/main
###