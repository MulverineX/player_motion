#> player_motion:internal/launch/main
# Launches players in the input local direction

scoreboard players set $mode player_motion.internal.gamemode -1
execute if entity @s[gamemode=survival] run return run scoreboard players set $mode player_motion.internal.gamemode 0
execute if entity @s[gamemode=creative] run scoreboard players set $mode player_motion.internal.gamemode 1

# TODO


execute if score $mode player_motion.internal.gamemode matches 0 run return run gamemode survival @s
execute if score $mode player_motion.internal.gamemode matches 1 run gamemode creative @s