#> player_motion:internal/math/sqrt_loop
#   Iterates through the square root algorithm
#   Credit: Part Toon
#
# Callers:
#   > player_motion:internal/math/sqrt_loop

# Compute test
scoreboard players operation $test player_motion.internal.math = $output player_motion.internal.math
scoreboard players operation $test player_motion.internal.math += $increment player_motion.internal.math
scoreboard players operation $test player_motion.internal.math *= $test player_motion.internal.math

# Compare
execute if score $test player_motion.internal.math <= $input player_motion.internal.math run scoreboard players operation $output player_motion.internal.math += $increment player_motion.internal.math

# Execute recursive function
scoreboard players operation $increment player_motion.internal.math /= #constant.2 player_motion.internal.math
execute if score $increment player_motion.internal.math matches 1.. run function player_motion:internal/math/sqrt_loop