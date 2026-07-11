#> player_motion:internal/launch/gamemode/get
execute if entity @s[gamemode=survival] run return run scoreboard players set $mode player_motion.internal.old.gamemode 0
execute if entity @s[gamemode=creative] run return run scoreboard players set $mode player_motion.internal.old.gamemode 1
execute if entity @s[gamemode=adventure] run return run scoreboard players set $mode player_motion.internal.old.gamemode 2
execute if entity @s[gamemode=spectator] run scoreboard players set $mode player_motion.internal.old.gamemode 3
