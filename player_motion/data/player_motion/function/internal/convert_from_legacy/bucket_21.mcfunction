# Bucket 21: crystal 42001 to 44000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_21 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_21 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy