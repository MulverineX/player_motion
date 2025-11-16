# Bucket 8: crystal 16001 to 18000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.08.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.08.adder player_motion.internal.const