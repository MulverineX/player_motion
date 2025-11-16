# Bucket 29: crystal 58001 to 60000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_29 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_29 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy