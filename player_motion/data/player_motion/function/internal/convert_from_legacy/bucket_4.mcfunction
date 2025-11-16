# Bucket 4: crystal 8001 to 10000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_4 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_4 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy