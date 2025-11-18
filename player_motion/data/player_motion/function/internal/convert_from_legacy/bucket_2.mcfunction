# Bucket 2: crystal 4001 to 6000
execute store result storage player_motion:tmp convert double 0.11530035743110803 run scoreboard players get $crystal player_motion.internal.dummy
execute store result score $crystal player_motion.internal.dummy run data get storage player_motion:tmp player_motion.internal.dummy 10
scoreboard players operation $temp player_motion.internal.dummy = $crystal player_motion.internal.dummy
scoreboard players operation $temp player_motion.internal.dummy %= #constant.10 player_motion.internal.const
execute if score $temp player_motion.internal.dummy matches 5.. run scoreboard players add $crystal player_motion.internal.dummy 10
scoreboard players operation $crystal player_motion.internal.dummy /= #constant.10 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy += $a_2 player_motion.internal.const
scoreboard players operation $crystal player_motion.internal.dummy *= #sign player_motion.internal.dummy