# Bucket 23: crystal 46001 to 48000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_23 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_23 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy