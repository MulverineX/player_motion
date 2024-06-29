#> player_motion:internal/subtick/get_player_uuid
#   Retrieve the player's UUID. If the player has been retrieved in the past, it can be retrieved faster than usual.

execute if score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 run data modify storage player_motion:storage UUID set value [I;0,0,0,0]
execute if score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 store result storage player_motion:storage UUID[0] int 1 run scoreboard players get @s player_motion.internal.uuid.0
execute if score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 store result storage player_motion:storage UUID[1] int 1 run scoreboard players get @s player_motion.internal.uuid.1
execute if score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 store result storage player_motion:storage UUID[2] int 1 run scoreboard players get @s player_motion.internal.uuid.2
execute if score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 store result storage player_motion:storage UUID[3] int 1 run scoreboard players get @s player_motion.internal.uuid.3

execute unless score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 run data modify storage player_motion:storage UUID set from entity @s UUID

execute unless score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 store result score @s player_motion.internal.uuid.0 run data get storage player_motion:storage UUID[0]
execute unless score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 store result score @s player_motion.internal.uuid.1 run data get storage player_motion:storage UUID[1]
execute unless score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 store result score @s player_motion.internal.uuid.2 run data get storage player_motion:storage UUID[2]
execute unless score @s player_motion.internal.uuid.3 matches -2147483648..2147483647 store result score @s player_motion.internal.uuid.3 run data get storage player_motion:storage UUID[3]