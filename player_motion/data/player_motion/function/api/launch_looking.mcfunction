#> player_motion:api/launch_looking
##
# @deprecated
# Launches the player in the direction the player is facing
#
# Does not support players in spectator mode
#
# @score<-64000..64000> $strength player_motion.api.launch - Approximate local Z velocity to launch with
##

execute on vehicle run return fail
execute if score $strength player_motion.api.launch matches 0 run return 0

scoreboard players operation $x_ player_motion.internal.dummy = $x player_motion.api.launch
scoreboard players operation $y_ player_motion.internal.dummy = $y player_motion.api.launch
scoreboard players operation $z_ player_motion.internal.dummy = $z player_motion.api.launch

execute store result score $crystal player_motion.internal.dummy store result score $bucket_index player_motion.internal.dummy run scoreboard players get $strength player_motion.api.launch
execute store result score $x player_motion.api.launch store result score $y player_motion.api.launch store result score $x player_motion.internal.dummy store result score $y player_motion.internal.dummy run scoreboard players set $z player_motion.internal.dummy 0

scoreboard players remove $bucket_index player_motion.internal.dummy 1
scoreboard players operation $bucket_index player_motion.internal.dummy /= #constant.2000 player_motion.internal.const
execute store result storage player_motion:internal/temp convert.index int 1 run scoreboard players get $bucket_index player_motion.internal.dummy

execute store result score $z player_motion.api.launch run function player_motion:internal/convert_from_legacy/index with storage player_motion:internal/temp convert

function player_motion:api/launch_context_xyz

scoreboard players operation $x player_motion.api.launch = $x_ player_motion.internal.dummy
scoreboard players operation $y player_motion.api.launch = $y_ player_motion.internal.dummy
scoreboard players operation $z player_motion.api.launch = $z_ player_motion.internal.dummy