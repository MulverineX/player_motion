# Index into the correct bucket
$function player_motion:internal/convert_from_legacy/bucket/$(index)
# Restore sign to impulse output & return its value
return run scoreboard players operation $crystal player_motion.internal.dummy *= $sign player_motion.internal.dummy