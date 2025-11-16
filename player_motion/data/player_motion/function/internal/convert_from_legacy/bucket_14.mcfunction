# Bucket 14: crystal 28001 to 30000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_14 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_14 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy