# Bucket 22: crystal 44001 to 46000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_22 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_22 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy