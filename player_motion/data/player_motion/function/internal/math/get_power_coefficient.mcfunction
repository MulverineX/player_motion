#> player_motion:internal/math/get_power_coefficient

#0 = standing
#1 = crouching
#2 = gliding, swimming, or crawling

scoreboard players set $player_status player_motion.internal.math 0
execute anchored eyes positioned ^ ^ ^ if entity @s[distance=..1.28] run scoreboard players set $player_status player_motion.internal.math 1
execute anchored eyes positioned ^ ^ ^ if entity @s[distance=..0.41] run scoreboard players set $player_status player_motion.internal.math 2

execute if score $player_status player_motion.internal.math matches 0 run function player_motion:internal/math/set_power/standing
execute if score $player_status player_motion.internal.math matches 1 run function player_motion:internal/math/set_power/crouching
execute if score $player_status player_motion.internal.math matches 2 run function player_motion:internal/math/set_power/gliding_swimming_crawling