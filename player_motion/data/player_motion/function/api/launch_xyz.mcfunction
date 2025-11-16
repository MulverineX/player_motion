#> player_motion:api/launch_xyz
# Launches the player in the input direction
execute on vehicle run return fail

# TODO: Run conversion from old velocity to new

execute as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0 0 0 positioned ^1 ^ ^ positioned ^-1 ^ ^ run function player_motion:internal/math/get_vector_info

scoreboard players set $temp player_motion.internal.dummy 0
execute if predicate player_motion:internal/large_global as d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f in minecraft:overworld positioned 0 0 0 store success score $temp player_motion.internal.dummy run function player_motion:internal/math/large_global_to_local
execute if score $temp player_motion.internal.dummy matches 0 run function player_motion:internal/math/global_to_local

function player_motion:internal/main