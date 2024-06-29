#> player_motion:internal/math/xyz_to_polar
#   Takes xyz coordinates, returns a looking direction and magnitude

#Move entity to end of vector
data modify storage player_motion:storage Pos set value [0d,0d,0d]
execute store result storage player_motion:storage Pos[0] double 0.0001 run scoreboard players get $temp player_motion.internal.x
execute store result storage player_motion:storage Pos[1] double 0.0001 run scoreboard players get $temp player_motion.internal.y
execute store result storage player_motion:storage Pos[2] double 0.0001 run scoreboard players get $temp player_motion.internal.z
data modify entity @s Pos set from storage player_motion:storage Pos
data remove storage player_motion:storage Pos

#Get looking direction
execute facing entity @s feet run tp @s ~ ~ ~ ~ ~
execute rotated as @s run tp @s ^ ^ ^1

#Get unit vector
data modify storage player_motion:storage Pos set from entity @s Pos
execute store result score $unit.x player_motion.internal.math run data get storage player_motion:storage Pos[0] 1000
execute store result score $unit.y player_motion.internal.math run data get storage player_motion:storage Pos[1] 1000
execute store result score $unit.z player_motion.internal.math run data get storage player_motion:storage Pos[2] 1000
data remove storage player_motion:storage Pos

#Use absolute value
execute if score $unit.x player_motion.internal.math matches ..-1 run scoreboard players operation $unit.x player_motion.internal.math *= #constant.-1 player_motion.internal.math
execute if score $unit.y player_motion.internal.math matches ..-1 run scoreboard players operation $unit.y player_motion.internal.math *= #constant.-1 player_motion.internal.math
execute if score $unit.z player_motion.internal.math matches ..-1 run scoreboard players operation $unit.z player_motion.internal.math *= #constant.-1 player_motion.internal.math

scoreboard players operation $abs_x player_motion.internal.math = $temp player_motion.internal.x
scoreboard players operation $abs_y player_motion.internal.math = $temp player_motion.internal.y
scoreboard players operation $abs_z player_motion.internal.math = $temp player_motion.internal.z

execute if score $abs_x player_motion.internal.math matches ..-1 run scoreboard players operation $abs_x player_motion.internal.math *= #constant.-1 player_motion.internal.math
execute if score $abs_y player_motion.internal.math matches ..-1 run scoreboard players operation $abs_y player_motion.internal.math *= #constant.-1 player_motion.internal.math
execute if score $abs_z player_motion.internal.math matches ..-1 run scoreboard players operation $abs_z player_motion.internal.math *= #constant.-1 player_motion.internal.math


#Set strength to the highest component of the vector / the highest component of the unit vector
scoreboard players operation $temp_strength player_motion.api.launch = $abs_x player_motion.internal.math
scoreboard players operation $temp_strength player_motion.api.launch > $abs_y player_motion.internal.math
scoreboard players operation $temp_strength player_motion.api.launch > $abs_z player_motion.internal.math
scoreboard players operation $temp_strength player_motion.api.launch *= #constant.1000 player_motion.internal.math

scoreboard players operation $unit.x player_motion.internal.math > $unit.y player_motion.internal.math
scoreboard players operation $unit.x player_motion.internal.math > $unit.z player_motion.internal.math

scoreboard players operation $temp_strength player_motion.api.launch /= $unit.x player_motion.internal.math

tp @s 0.0 0.0 0.0