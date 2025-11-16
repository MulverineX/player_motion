#> player_motion:api/launch_looking
# Launches the player in the input direction
execute on vehicle run return fail

scoreboard players set $x player_motion.api.launch 0
scoreboard players set $y player_motion.api.launch 0
scoreboard players operation $z player_motion.api.launch = $strength player_motion.api.launch

function player_motion:internal/launch/main