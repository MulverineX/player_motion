#> handle_polar.mcfunction
## Handle polar axis gimbal lock case (x vertical rotation of `-90` degrees)

## Swap y and z, flip sign of y. If y horizontal rotation is between 90 and -90, flip sign of x and restore sign of y.
scoreboard players operation $y player_motion.internal.dummy >< $z player_motion.internal.dummy
scoreboard players operation $y player_motion.internal.dummy *= #constant.-1 player_motion.internal.const
execute if entity @s[y_rotation=90..-90] run function player_motion:internal/math/polar/flip_xy

    ## Launch with local launch vector stored in modified internal $x/$y/$z scores, return `1` to indicate motion was applied
    return run function player_motion:internal/launch/main
###