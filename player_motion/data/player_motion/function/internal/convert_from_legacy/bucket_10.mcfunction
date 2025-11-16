# Bucket 10: crystal 20001 to 22000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.10.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.10.adder player_motion.internal.const