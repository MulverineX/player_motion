# Bucket 25: crystal 50001 to 52000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_25 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_25 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy