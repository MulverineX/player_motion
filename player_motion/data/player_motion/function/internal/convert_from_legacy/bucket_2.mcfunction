# Bucket 2: crystal 4001 to 6000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.02.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.02.adder player_motion.internal.const