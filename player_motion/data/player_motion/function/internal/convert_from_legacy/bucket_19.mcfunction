# Bucket 19: crystal 38001 to 40000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_19 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_19 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy