#> player_motion:internal/subtick/shift_entity
#   Temporarily moves an entity out of the way so it isn't affected by the explosion
#
# Callers:
#   > player_motion:internal/pre_explosion_subtick

#Set Invulnerable to 1b and get whether the original value was 0b.
execute store success score @s player_motion.internal.invulnerable run data modify entity @s Invulnerable set value 1b
#Invert 0b/1b
execute store success score @s player_motion.internal.invulnerable if score @s player_motion.internal.invulnerable matches 0

data modify storage player_motion:storage Motion set from entity @s Motion
execute store result score @s player_motion.internal.motion.x run data get storage player_motion:storage Motion[0] 10000000
execute store result score @s player_motion.internal.motion.y run data get storage player_motion:storage Motion[1] 10000000
execute store result score @s player_motion.internal.motion.z run data get storage player_motion:storage Motion[2] 10000000
data remove storage player_motion:storage Motion

tag @s add player_motion.shifted