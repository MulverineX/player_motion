# Bucket 10: crystal 20001 to 22000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_10 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_10 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy