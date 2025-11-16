# Bucket 15: crystal 30001 to 32000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_15 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_15 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy