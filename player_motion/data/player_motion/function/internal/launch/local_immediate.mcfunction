#> local_immediate.mcfunction
## Attempt to launch the player without preprocessing input for rotation.
## This is intended to be ran before checking for y_rotation=-90, as special logic is needed for that.

## If the player is not looking directly along the polar axis, skips handling a special case to avoid gimbal lock issues
execute unless entity @s[x_rotation=-90] run return run function player_motion:internal/launch/main

    # If x,y are both 0, Z still behaves normally so the function can run.
    execute \
        if score $x player_motion.internal.dummy matches 0 \
        if score $y player_motion.internal.dummy matches 0 \
        run return run function player_motion:internal/launch/main

    # In the -90 case, X and Y become locked to global space. Therefore, both
    # of these must be rotated to function correctly.

    ## Store local launch vector into matrix x/y/z storage from $x/$y/$z scores
    execute store result storage player_motion:internal/temp matrix.x double 1 run \
        scoreboard players get $x player_motion.internal.dummy
    execute store result storage player_motion:internal/temp matrix.y double 1 run \
        scoreboard players get $y player_motion.internal.dummy

    ## Convert local-to-context launch vector to global launch vector via dummy marker entity, stores directly back into `matrix` x/y/z storage & internal $x/$y/$z scores
    execute rotated as @s as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function player_motion:internal/math/local_to_global_2axis with storage player_motion:internal/temp matrix
        
    ## Flip sign of y. If y horizontal rotation is between 90 and -90, flip sign of x and restore sign of y.
    scoreboard players operation $y player_motion.internal.dummy *= #constant.-1 player_motion.internal.const
    execute if entity @s[y_rotation=90..-90] run function player_motion:internal/math/polar/flip_xy

    ## Launch with local launch vector stored in modified internal $x/$y/$z scores, return `1` to indicate motion was applied
    return run function player_motion:internal/launch/main
