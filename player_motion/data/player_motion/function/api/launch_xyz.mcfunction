#> player_motion:api/launch_xyz
#   Launches the player in the input direction
#
# Inputs:
#   executed as player at player's position
#   score $x player_motion.api.launch       <<< Strength to launch in x direction
#   score $y player_motion.api.launch       <<< Strength to launch in y direction
#   score $z player_motion.api.launch       <<< Strength to launch in z direction
#
# Outputs
#   player is launched in the specified direction

#Flag indicating that players need to be launched, tag the player to be launched
scoreboard players set $function_called player_motion.internal.dummy 1
tag @s add player_motion.launch

scoreboard players operation @s player_motion.internal.x += $x player_motion.api.launch
scoreboard players operation @s player_motion.internal.y += $y player_motion.api.launch
scoreboard players operation @s player_motion.internal.z += $z player_motion.api.launch

