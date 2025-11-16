# Bucket 30: crystal 60001 to 62000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.30.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.30.adder player_motion.internal.const