# Bucket 13: crystal 26001 to 28000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_13 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_13 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy