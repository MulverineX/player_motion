# Bucket 1: crystal 2001 to 4000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_1 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_1 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy