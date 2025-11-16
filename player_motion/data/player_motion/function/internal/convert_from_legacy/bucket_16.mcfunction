# Bucket 16: crystal 32001 to 34000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_16 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_16 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy