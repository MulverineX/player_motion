#> player_motion:api/launch_context_xyz
##
# Launches the player in the input direction relative to the current rotation context
#
# Does not support players in spectator mode nor mounted players
#
# @score $x player_motion.api.launch - Local X velocity to launch with
# @score $y player_motion.api.launch - Local Y velocity to launch with
# @score $z player_motion.api.launch - Local Z velocity to launch with
#
# @returns<0 | 1> - 0 if no motion was applied, 1 if motion was applied
##

execute \
    if score $x player_motion.api.launch matches 0 \
    if score $y player_motion.api.launch matches 0 \
    if score $z player_motion.api.launch matches 0 \
    run return 0

execute positioned as @s positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.00001] run return run function player_motion:api/launch_local_xyz


execute store result storage player_motion:internal/temp matrix.x double 1 run scoreboard players get $x player_motion.api.launch
execute store result storage player_motion:internal/temp matrix.y double 1 run scoreboard players get $y player_motion.api.launch
execute store result storage player_motion:internal/temp matrix.z double 1 run scoreboard players get $z player_motion.api.launch
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

function player_motion:internal/main


return 1