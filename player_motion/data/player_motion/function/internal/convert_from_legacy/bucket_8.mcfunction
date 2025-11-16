# Bucket 8: crystal 16001 to 18000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_8 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_8 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy