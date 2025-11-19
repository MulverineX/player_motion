#> player_motion:api/launch_looking
##
# @deprecated
# Launches the player in the direction the player is facing
#
# Does not support players in spectator mode
#
# @score $strength player_motion.api.launch (-64000..64000) - Approximate local Z velocity to launch with
##

execute on vehicle run return fail
execute if score $strength player_motion.api.launch matches 0 run return 0

data modify storage player_motion:internal/temp matrix set value {x: 0.0d, y: 0.0d}
execute store result score $x player_motion.internal.dummy run scoreboard players set $y player_motion.internal.dummy 0

execute store result score $crystal player_motion.internal.dummy store result score $bucket_index player_motion.internal.dummy run scoreboard players get $strength player_motion.api.launch
execute store result score $x player_motion.internal.dummy run scoreboard players set $y player_motion.internal.dummy 0

scoreboard players remove $bucket_index player_motion.internal.dummy 1
scoreboard players operation $bucket_index player_motion.internal.dummy /= $constant.2000 player_motion.internal.const
execute store result storage player_motion:internal/temp convert.index int 1 run scoreboard players get $bucket_index player_motion.internal.dummy

execute store result score $z player_motion.internal.dummy store result storage player_motion:internal/temp matrix.z double 1 run function player_motion:internal/convert_from_legacy/index with storage player_motion:internal/temp convert

execute positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.00001] run return run function player_motion:internal/launch/main

execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run function player_motion:internal/math/rotate_by_context with storage player_motion:internal/temp matrix

execute rotated as @s as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run function player_motion:internal/math/get_vector_info

data modify storage player_motion:internal/temp matrix.ix set from storage player_motion:internal/temp vec_i[0]
data modify storage player_motion:internal/temp matrix.iz set from storage player_motion:internal/temp vec_i[2]

data modify storage player_motion:internal/temp matrix.jx set from storage player_motion:internal/temp vec_j[0]
data modify storage player_motion:internal/temp matrix.jy set from storage player_motion:internal/temp vec_j[1]
data modify storage player_motion:internal/temp matrix.jz set from storage player_motion:internal/temp vec_j[2]

data modify storage player_motion:internal/temp matrix.kx set from storage player_motion:internal/temp vec_k[0]
data modify storage player_motion:internal/temp matrix.ky set from storage player_motion:internal/temp vec_k[1]
data modify storage player_motion:internal/temp matrix.kz set from storage player_motion:internal/temp vec_k[2]
execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run function player_motion:internal/math/vector_matrix with storage player_motion:internal/temp matrix

function player_motion:internal/launch/main