#> player_motion:api/launch_looking
#   Launches the player in the input direction
#
# Inputs:
#   execute rotated <desired direction>
#   score $strength player_motion.api.launch       <<< Strength to launch in looking direction (scaled up by 10000)
#
# Outputs
#   player is launched in the looking direction of the command with the desired strength

#Flag indicating that players need to be launched, tag the player to be launched
scoreboard players set $function_called player_motion.internal.dummy 1
tag @s add player_motion.launch

execute as d59ee2c6-58c8-4885-b9db-ecff066e4439 in minecraft:overworld positioned 0.0 0.0 0.0 run function player_motion:internal/math/polar_to_xyz

scoreboard players operation @s player_motion.internal.x += $out player_motion.internal.x
scoreboard players operation @s player_motion.internal.y += $out player_motion.internal.y
scoreboard players operation @s player_motion.internal.z += $out player_motion.internal.z