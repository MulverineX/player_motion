# Bucket 9: crystal 18001 to 20000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_9 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_9 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy