$teleport @s ^$(x) ^$(y) ^$(z)
data modify storage player_motion:internal/temp matrix.x set from entity @s Pos[0]
data modify storage player_motion:internal/temp matrix.y set from entity @s Pos[1]
data modify storage player_motion:internal/temp matrix.z set from entity @s Pos[2]

execute store result score $x player_motion.internal.dummy run data get storage player_motion:internal/temp matrix.x
execute store result score $y player_motion.internal.dummy run data get storage player_motion:internal/temp matrix.y
execute store result score $z player_motion.internal.dummy run data get storage player_motion:internal/temp matrix.z
teleport @s 0.0 0.0 0.0 0.0 0.0