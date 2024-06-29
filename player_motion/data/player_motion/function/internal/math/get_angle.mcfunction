#> player_motion:internal/math/get_angle
#   Gets the offset angle to get the proper momentum cancellation and leave the right amount of forceload
#
# Callers:
#   > player_motion:api/launch_looking

#Determine power coefficient from eye level
function player_motion:internal/math/get_power_coefficient

#If strength is large, figure out number of creepers needed
scoreboard players operation $creeper_count player_motion.internal.math = $temp_strength player_motion.api.launch
scoreboard players operation $momentum_per_iteration player_motion.internal.math = $divisor player_motion.internal.math
scoreboard players operation $momentum_per_iteration player_motion.internal.math *= #constant.100 player_motion.internal.math
scoreboard players operation $creeper_count player_motion.internal.math /= $momentum_per_iteration player_motion.internal.math
scoreboard players add $creeper_count player_motion.internal.math 1

scoreboard players operation $adjusted_strength player_motion.internal.math = $temp_strength player_motion.api.launch
scoreboard players operation $adjusted_strength player_motion.internal.math /= $creeper_count player_motion.internal.math


#X: sqrt (p^2 - (d^2)/4) -- d is desired power, p is max possible power produceable by 1 creeper
#Scale factors:
# adjusted_strength: 10000
# $input: 100000000
# p^2: 100000000
# output: 10000

scoreboard players operation $input player_motion.internal.math = $p_squared player_motion.internal.math
scoreboard players operation $d player_motion.internal.math = $adjusted_strength player_motion.internal.math
scoreboard players operation $d player_motion.internal.math *= $d player_motion.internal.math
scoreboard players operation $d player_motion.internal.math /= #constant.4 player_motion.internal.math
scoreboard players operation $input player_motion.internal.math -= $d player_motion.internal.math

function player_motion:internal/math/sqrt

#Get atan2
scoreboard players operation $adjusted_strength player_motion.internal.math /= #constant.2 player_motion.internal.math
execute in overworld as d59ee2c6-58c8-4885-b9db-ecff066e4439 positioned 0.0 0.0 0.0 run function player_motion:internal/math/arcsin

#Get relative to current angle
execute store result storage player_motion:macros rotation.positive int 0.000001 run scoreboard players get $rotation_offset player_motion.internal.math
execute store result storage player_motion:macros rotation.negative int -0.000001 run scoreboard players get $rotation_offset player_motion.internal.math