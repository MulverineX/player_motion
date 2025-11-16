# Bucket 25: crystal 50001 to 52000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.25.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.25.adder player_motion.internal.const