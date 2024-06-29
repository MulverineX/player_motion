#> player_motion:internal/subtick/unshift_entity
#   Returns entities to their normal position
#
# Callers:
#   > player_motion:internal/post_explosion_subtick

execute store result entity @s Invulnerable byte 1 run scoreboard players get @s player_motion.internal.invulnerable

data modify storage player_motion:storage Motion set value [0d,0d,0d]
execute store result storage player_motion:storage Motion[0] double 0.0000001 run scoreboard players get @s player_motion.internal.motion.x
execute store result storage player_motion:storage Motion[1] double 0.0000001 run scoreboard players get @s player_motion.internal.motion.y
execute store result storage player_motion:storage Motion[2] double 0.0000001 run scoreboard players get @s player_motion.internal.motion.z
data modify entity @s Motion set from storage player_motion:storage Motion
data remove storage player_motion:storage Motion


tag @s remove player_motion.shifted