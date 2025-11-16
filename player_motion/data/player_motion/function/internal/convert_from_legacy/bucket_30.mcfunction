# Bucket 30: crystal 60001 to 62000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_30 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_30 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy