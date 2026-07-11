teleport @s ^1 ^ ^
data modify storage player_motion:internal/temp vec_i set from entity @s Pos
teleport @s ^ ^1 ^
data modify storage player_motion:internal/temp vec_j set from entity @s Pos
teleport @s ^ ^ ^1
data modify storage player_motion:internal/temp vec_k set from entity @s Pos
teleport @s 0.0 0.0 0.0 0.0 0.0