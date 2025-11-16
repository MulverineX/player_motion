# Bucket 0: crystal 1 to 2000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_0 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_0 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy