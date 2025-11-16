# Bucket 12: crystal 24001 to 26000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_12 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_12 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy