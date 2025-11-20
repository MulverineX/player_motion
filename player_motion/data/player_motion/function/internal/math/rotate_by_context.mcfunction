$teleport @s ^$(x) ^$(y) ^$(z)
data modify storage player_motion:internal/temp matrix.x set from entity @s Pos[0]
data modify storage player_motion:internal/temp matrix.y set from entity @s Pos[1]
data modify storage player_motion:internal/temp matrix.z set from entity @s Pos[2]
teleport @s 0.0 0.0 0.0