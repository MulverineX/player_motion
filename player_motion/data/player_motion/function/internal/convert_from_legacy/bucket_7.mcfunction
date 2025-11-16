# Bucket 7: crystal 14001 to 16000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_7 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_7 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy