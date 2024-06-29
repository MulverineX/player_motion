#> player_motion:internal/launch/launch_looking
#   Launches the player in the input direction
#
# Inputs:
#   executed as player at player's position
#   execute rotated <desired direction>
#   score $temp_strength player_motion.api.launch       <<< Strength to launch in looking direction (scaled up by 10000)
#
# Outputs
#   player is launched in the looking direction of the command with the desired strength

#Set up bat + arrow to trigger advancement immediately before explosion
execute positioned ~ ~10000 ~ run function player_motion:internal/subtick/begin_launch_context

#Figure out offset angle to get reduced motion
function player_motion:internal/math/get_angle

#Check if peaceful
execute store result score $diff player_motion.internal.gamemode run difficulty
execute if score $diff player_motion.internal.gamemode matches 0 run difficulty easy

#Summon creepers
scoreboard players operation $temp player_motion.internal.id = @s player_motion.internal.id

execute anchored eyes positioned ^ ^ ^ run function player_motion:internal/summon/summon_creepers with storage player_motion:macros rotation

#Set up bat + arrow to trigger advancement immediately after explosion
execute positioned ~ ~12000 ~ run function player_motion:internal/subtick/end_launch_context