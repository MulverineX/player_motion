# TODO: Compare performance of using an entity for this math vs the old trig

execute store result storage player_motion:internal/temp matrix.x double 1 run scoreboard players get $x player_motion.api.launch
execute store result storage player_motion:internal/temp matrix.y double 1 run scoreboard players get $y player_motion.api.launch
execute store result storage player_motion:internal/temp matrix.z double 1 run scoreboard players get $z player_motion.api.launch
data modify storage player_motion:internal/temp matrix.ix set from storage player_motion:internal/temp vec_i[0]
data modify storage player_motion:internal/temp matrix.iz set from storage player_motion:internal/temp vec_i[2]

data modify storage player_motion:internal/temp matrix.jx set from storage player_motion:internal/temp vec_j[0]
data modify storage player_motion:internal/temp matrix.jy set from storage player_motion:internal/temp vec_j[1]
data modify storage player_motion:internal/temp matrix.jz set from storage player_motion:internal/temp vec_j[2]

data modify storage player_motion:internal/temp matrix.kx set from storage player_motion:internal/temp vec_k[0]
data modify storage player_motion:internal/temp matrix.ky set from storage player_motion:internal/temp vec_k[1]
data modify storage player_motion:internal/temp matrix.kz set from storage player_motion:internal/temp vec_k[2]

function player_motion:internal/math/vector_matrix with storage player_motion:internal/temp matrix