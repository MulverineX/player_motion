# Bucket 17: crystal 34001 to 36000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_17 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_17 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy