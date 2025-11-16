#> player_motion:api/launch_xyz
##
# @deprecated
# Launches the player in the input direction
#
# Does not support players in spectator mode
#
# @score<-64000..64000> $x player_motion.api.launch - Approximate global X velocity to launch with
# @score<-64000..64000> $y player_motion.api.launch - Approximate global Y velocity to launch with
# @score<-64000..64000> $z player_motion.api.launch - Approximate global Z velocity to launch with
##

execute on vehicle run return fail

execute store result score $x player_motion.internal.dummy store result score $y player_motion.internal.dummy run scoreboard players set $z player_motion.internal.dummy 0

scoreboard players operation $x_ player_motion.internal.dummy = $x player_motion.api.launch
scoreboard players operation $y_ player_motion.internal.dummy = $y player_motion.api.launch
scoreboard players operation $z_ player_motion.internal.dummy = $z player_motion.api.launch


execute unless score $x player_motion.api.launch matches 0 run \
    function player_motion:internal/convert_from_legacy/entry/x
execute unless score $y player_motion.api.launch matches 0 run \
    function player_motion:internal/convert_from_legacy/entry/y
execute unless score $z player_motion.api.launch matches 0 run \
    function player_motion:internal/convert_from_legacy/entry/z


execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0.0 0.0 0.0 run \
    function player_motion:internal/math/get_vector_info


scoreboard players set $temp player_motion.internal.dummy 0

execute if predicate player_motion:internal/large_global as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f \ 
    store success score $temp player_motion.internal.dummy \
    in minecraft:overworld positioned 0.0 0.0 0.0 run \
    function player_motion:internal/math/large_global_to_local

execute if score $temp player_motion.internal.dummy matches 0 run \
    function player_motion:internal/math/global_to_local

function player_motion:internal/main

scoreboard players operation $x player_motion.api.launch = $x_ player_motion.internal.dummy
scoreboard players operation $y player_motion.api.launch = $y_ player_motion.internal.dummy
scoreboard players operation $z player_motion.api.launch = $z_ player_motion.internal.dummy