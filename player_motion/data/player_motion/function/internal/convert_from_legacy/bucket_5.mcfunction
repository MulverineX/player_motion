# Bucket 5: crystal 10001 to 12000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.05.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.05.adder player_motion.internal.const