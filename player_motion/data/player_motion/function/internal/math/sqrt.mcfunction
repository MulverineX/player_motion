#> player_motion:internal/math/sqrt
#   Calculates the square root of an input number
#   Credit: Part Toon
#
# Callers:
#   > player_motion:api/launch_looking
#
# Inputs:
#   score $input player_motion.internal.math
#
# Outputs:
#   score $output player_motion.internal.math

# Initialize values

scoreboard players set $output player_motion.internal.math 0
scoreboard players set $increment player_motion.internal.math 32768

# Execute recursive function

function player_motion:internal/math/sqrt_loop