# Bucket 6: crystal 12001 to 14000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_6 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_6 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy