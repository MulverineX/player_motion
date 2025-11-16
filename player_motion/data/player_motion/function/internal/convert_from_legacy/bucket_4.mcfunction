# Bucket 4: crystal 8001 to 10000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.04.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.04.adder player_motion.internal.const