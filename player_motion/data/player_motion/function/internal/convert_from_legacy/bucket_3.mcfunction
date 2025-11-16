# Bucket 3: crystal 6001 to 8000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.03.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.03.adder player_motion.internal.const