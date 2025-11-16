# Bucket 16: crystal 32001 to 34000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.16.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.16.adder player_motion.internal.const