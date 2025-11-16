# Bucket 3: crystal 6001 to 8000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_3 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_3 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy