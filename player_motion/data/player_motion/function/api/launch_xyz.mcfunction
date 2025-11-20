#> player_motion:api/launch_xyz
##
# @deprecated
# Launches the player in the input direction
#
# Does not support players in spectator mode
#
# @score $x player_motion.api.launch (-64000..64000) - Approximate global X velocity to launch with
# @score $y player_motion.api.launch (-64000..64000) - Approximate global Y velocity to launch with
# @score $z player_motion.api.launch (-64000..64000) - Approximate global Z velocity to launch with
##

execute on vehicle run return fail

execute \
    if score $x player_motion.api.launch matches 0 \
    if score $y player_motion.api.launch matches 0 \
    if score $z player_motion.api.launch matches 0 \
    run return 0

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
    store result score $temp player_motion.internal.dummy \
    in minecraft:overworld positioned 0.0 0.0 0.0 run \
    function player_motion:internal/math/large_global_to_local

execute if score $temp player_motion.internal.dummy matches 0 run \
    function player_motion:internal/math/global_to_local

function player_motion:internal/launch/main