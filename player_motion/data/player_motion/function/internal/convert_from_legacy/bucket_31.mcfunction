# Bucket 31: crystal 62001 to 64000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_31 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_31 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy