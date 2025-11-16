# Bucket 5: crystal 10001 to 12000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_5 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_5 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy