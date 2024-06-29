#> player_motion:internal/math/arcsin
#   Calculates arcsin
#
# Callers:
#   > player_motion:api/launch_looking
#
# Inputs:
#   executed as and at marker
#   score $output player_motion.internal.math
#   score $adjusted_strength player_motion.internal.math
#
# Outputs:
#   $rotation_offset player_motion.internal.math

data modify storage player_motion:storage Pos set value [0d,0d,0d]
execute store result storage player_motion:storage Pos[0] double 0.0001 run scoreboard players get $output player_motion.internal.math
execute store result storage player_motion:storage Pos[1] double 0.0001 run scoreboard players get $adjusted_strength player_motion.internal.math
data modify entity @s Pos set from storage player_motion:storage Pos
data remove storage player_motion:storage Pos

execute facing entity @s feet run tp @s ~ ~ ~ ~ ~

execute store result score $complementary_angle player_motion.internal.math run data get entity @s Rotation[1] 1000000
scoreboard players set $rotation_offset player_motion.internal.math 90000000
scoreboard players operation $rotation_offset player_motion.internal.math += $complementary_angle player_motion.internal.math

execute in overworld run tp @s 0.0 0.0 0.0