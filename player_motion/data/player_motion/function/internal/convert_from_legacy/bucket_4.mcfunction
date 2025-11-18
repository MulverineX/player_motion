# Bucket 4: crystal 8001 to 10000
execute store result storage player_motion:tmp convert double 0.5807200929152149 run scoreboard players get $crystal player_motion.internal.dummy
execute store result score $crystal player_motion.internal.dummy run data get storage player_motion:tmp player_motion.internal.dummy 10
scoreboard players operation $temp player_motion.internal.dummy = $crystal player_motion.internal.dummy
scoreboard players operation $temp player_motion.internal.dummy %= #constant.10 player_motion.internal.const
execute if score $temp player_motion.internal.dummy matches 5.. run scoreboard players add $crystal player_motion.internal.dummy 10
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.10 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_4 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy *= #sign player_motion.internal.dummy