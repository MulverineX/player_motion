#> player_motion:internal/launch/main
#   Executes the commands to launch the player
#
# Inputs:
#   score @s player_motion.internal.x    <<< Strength to launch in x direction
#   score @s player_motion.internal.y    <<< Strength to launch in y direction
#   score @s player_motion.internal.z    <<< Strength to launch in z direction

scoreboard players operation $temp player_motion.internal.x = @s player_motion.internal.x
scoreboard players operation $temp player_motion.internal.y = @s player_motion.internal.y
scoreboard players operation $temp player_motion.internal.z = @s player_motion.internal.z

execute in overworld as d59ee2c6-58c8-4885-b9db-ecff066e4439 run function player_motion:internal/math/xyz_to_polar_wrapper
execute rotated as d59ee2c6-58c8-4885-b9db-ecff066e4439 run function player_motion:internal/launch/launch_looking

#Disables flag indicating that players need to be launched and removes tag
scoreboard players set $function_called player_motion.internal.dummy 0
tag @s remove player_motion.launch

#Reset scoreboards
scoreboard players reset @s player_motion.internal.x
scoreboard players reset @s player_motion.internal.y
scoreboard players reset @s player_motion.internal.z