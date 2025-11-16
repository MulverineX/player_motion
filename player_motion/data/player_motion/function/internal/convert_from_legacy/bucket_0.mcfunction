# Bucket 0: crystal 1 to 2000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.00.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.00.adder player_motion.internal.const