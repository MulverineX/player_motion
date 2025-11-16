# Bucket 15: crystal 30001 to 32000
scoreboard players operation $crystal player_motion.internal.dummy *= $convert.15.multiplier player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.1000000 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $convert.15.adder player_motion.internal.const