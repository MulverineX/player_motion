# Bucket 1: crystal 2001 to 4000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.01.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.01.adder player_motion.internal.const