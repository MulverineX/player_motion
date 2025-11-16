# Bucket 20: crystal 40001 to 42000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_20 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_20 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy