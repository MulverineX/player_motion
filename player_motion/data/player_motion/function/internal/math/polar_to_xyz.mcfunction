#> player_motion:internal/math/polar_to_xyz
#   Converts a looking direction and magnitude into xyz coordinates

tp @s ^ ^ ^1
data modify storage player_motion:storage Pos set from entity @s Pos

execute store result score $out player_motion.internal.x run data get storage player_motion:storage Pos[0] 4096
execute store result score $out player_motion.internal.y run data get storage player_motion:storage Pos[1] 4096
execute store result score $out player_motion.internal.z run data get storage player_motion:storage Pos[2] 4096

scoreboard players operation $out player_motion.internal.y *= $strength player_motion.api.launch
scoreboard players operation $out player_motion.internal.x *= $strength player_motion.api.launch
scoreboard players operation $out player_motion.internal.z *= $strength player_motion.api.launch

scoreboard players operation $out player_motion.internal.x /= #constant.4096 player_motion.internal.math
scoreboard players operation $out player_motion.internal.y /= #constant.4096 player_motion.internal.math
scoreboard players operation $out player_motion.internal.z /= #constant.4096 player_motion.internal.math

tp @s 0.0 0.0 0.0