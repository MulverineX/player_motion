# Bucket 26: crystal 52001 to 54000
scoreboard players operation $crystal player_motion.internal.dummy *= $m_26 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= $d player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_26 player_motion.internal.const
return run scoreboard players get $crystal player_motion.internal.dummy