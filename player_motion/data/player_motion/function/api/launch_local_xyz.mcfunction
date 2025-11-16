#> player_motion:api/launch_local_xyz
##
# Launches the player in the input direction along the local axes
#
# Does not support players in spectator mode nor mounted players
#
# @score $x player_motion.api.launch - Local X velocity to launch with
# @score $y player_motion.api.launch - Local Y velocity to launch with
# @score $z player_motion.api.launch - Local Z velocity to launch with
#
# @returns<0 | 1> - 0 if no motion was applied, 1 if motion was applied
##

execute \
    if score $x player_motion.api.launch matches 0 \
    if score $y player_motion.api.launch matches 0 \
    if score $z player_motion.api.launch matches 0 \
    run return 0

scoreboard players operation $x player_motion.internal.dummy = $x player_motion.api.launch
scoreboard players operation $y player_motion.internal.dummy = $y player_motion.api.launch
scoreboard players operation $z player_motion.internal.dummy = $z player_motion.api.launch

function player_motion:internal/main


return 1