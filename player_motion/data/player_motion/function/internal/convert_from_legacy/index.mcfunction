# Store sign of crystal input
execute if score $crystal player_motion.internal.dummy matches ..-1 run scoreboard players set $sign player_motion.internal.dummy -1
execute if score $crystal player_motion.internal.dummy matches 0.. run scoreboard players set $sign player_motion.internal.dummy 1
# Work with absolute value of crystal
execute if score $crystal player_motion.internal.dummy matches ..-1 run scoreboard players operation $crystal player_motion.internal.dummy *= $sign player_motion.internal.dummy
# Index into the correct bucket
$function player_motion:internal/convert_from_legacy/bucket_$(index)
# Restore sign to impulse output
scoreboard players operation $crystal player_motion.internal.dummy *= $sign player_motion.internal.dummy

return run scoreboard players get $crystal player_motion.internal.dummy