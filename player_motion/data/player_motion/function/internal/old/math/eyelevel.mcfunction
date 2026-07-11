#> player_motion:internal/old/math/eyelevel
# eyelevel=y(eyes)-y(player)
execute anchored eyes positioned ^ ^ ^ if entity @s[distance=...41] run \
    return run scoreboard players set $eyelevel player_motion.internal.old.math 40

execute anchored eyes positioned ^ ^ ^ if entity @s[distance=..1.27] run \
    return run scoreboard players set $eyelevel player_motion.internal.old.math 127

scoreboard players set $eyelevel player_motion.internal.old.math 162