# Store sign of crystal input
execute if score $crystal player_motion.internal.dummy matches ..-1 run scoreboard players set $sign player_motion.internal.dummy -1
execute if score $crystal player_motion.internal.dummy matches 0.. run scoreboard players set $sign player_motion.internal.dummy 1
# Work with absolute value of crystal
execute if score $crystal player_motion.internal.dummy matches ..-1 run scoreboard players operation $crystal player_motion.internal.dummy *= $sign player_motion.internal.dummy
# Index function to route to correct bucket
scoreboard players operation $bucket_index player_motion.internal.dummy = $crystal player_motion.internal.dummy
scoreboard players remove $bucket_index player_motion.internal.dummy 1
scoreboard players operation $bucket_index player_motion.internal.dummy /= $find_index player_motion.internal.const
execute store result storage player_motion:internal/temp convert.index int 1 run scoreboard players get $bucket_index player_motion.internal.dummy
function player_motion:internal/convert_from_legacy/route with storage player_motion:internal/temp convert
# Restore sign to impulse output
scoreboard players operation $crystal player_motion.internal.dummy *= $sign player_motion.internal.dummy

return run scoreboard players get $crystal player_motion.internal.dummy