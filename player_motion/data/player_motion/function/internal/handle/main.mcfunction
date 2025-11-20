scoreboard players operation $_x player_motion.internal.dummy = $x player_motion.api.launch
scoreboard players operation $_y player_motion.internal.dummy = $y player_motion.api.launch
scoreboard players operation $_z player_motion.internal.dummy = $z player_motion.api.launch

scoreboard players operation $y player_motion.api.launch >< $z player_motion.api.launch
scoreboard players operation $y player_motion.api.launch *= #constant.-1 player_motion.internal.const
execute rotated ~ 0 positioned .5 .0 .0 positioned ^ ^ ^-.5 align xyz facing .0 0 -.5 positioned as @s positioned ^ ^ ^1 if entity @s[dx=0,dy=0,dz=0] run function player_motion:internal/handle/flip
function player_motion:api/launch_local_xyz

scoreboard players operation $x player_motion.api.launch = $_x player_motion.internal.dummy
scoreboard players operation $y player_motion.api.launch = $_y player_motion.internal.dummy
scoreboard players operation $z player_motion.api.launch = $_z player_motion.internal.dummy