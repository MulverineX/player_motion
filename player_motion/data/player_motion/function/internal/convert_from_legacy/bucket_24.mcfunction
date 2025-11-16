# Bucket 24: crystal 48001 to 50000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.24.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.24.adder player_motion.internal.const