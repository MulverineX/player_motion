# Bucket 27: crystal 54001 to 56000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_27 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_27 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy