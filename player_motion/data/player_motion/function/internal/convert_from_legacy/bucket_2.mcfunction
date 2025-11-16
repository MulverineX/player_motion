# Bucket 2: crystal 4001 to 6000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_2 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_2 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy