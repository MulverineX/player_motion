#> local.mcfunction
##
# During the local polar axis case, mitigate mojank's broken rotation math
#
# When:
# - Local launch vector is needed
# - Player is looking directly along the polar axis (x rotation of `-90` degrees)
# - Player viewing angle is the same as the context angle
##

## Only x and y need to be rotated to compensate for mojank's broken rotation math, if both are zero the launch can continue without handling.
execute \
    if score #x player_motion.internal.dummy matches 0 \
    if score #y player_motion.internal.dummy matches 0 \
    run return run function player_motion:internal/launch/main

### Convert local x/y to global x/y because the broken rotation is within the global space
    ## Store into matrix x/y storage from #x/#y scores
    execute store result storage player_motion:internal/temp matrix.x double 1 run \
        scoreboard players get #x player_motion.internal.dummy
    execute store result storage player_motion:internal/temp matrix.y double 1 run \
        scoreboard players get #y player_motion.internal.dummy

    ## Convert via dummy marker entity, stores directly back into #x/#y scores
    execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function player_motion:internal/math/polar_local_xy_to_global with storage player_motion:internal/temp matrix
###

### Explanation & video: https://discord.com/channels/154777837382008833/1221689674611818556/1444803724043354144
    ## If y horizontal rotation is between 90 and -90, flip sign of x.
    scoreboard players set #y_abs_within_90 player_motion.internal.dummy 0
    execute if entity @s[y_rotation=90..-90] \
        store success score #y_abs_within_90 player_motion.internal.dummy run \
        scoreboard players operation #x player_motion.internal.dummy *= #constant.-1 player_motion.internal.const

    ## Else, flip sign of y.
    execute if score #y_abs_within_90 player_motion.internal.dummy matches 0 run \
        scoreboard players operation #y player_motion.internal.dummy *= #constant.-1 player_motion.internal.const
###

## Launch locally with modified #x/#y scores and the original $z score, pass the return value of `1` to indicate motion was applied
return run function player_motion:internal/launch/main