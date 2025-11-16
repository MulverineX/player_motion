execute store result score $crystal player_motion.internal.dummy store result score $bucket_index player_motion.internal.dummy run scoreboard players get $z player_motion.api.launch
scoreboard players remove $bucket_index player_motion.internal.dummy 1
scoreboard players operation $bucket_index player_motion.internal.dummy /= #constant.2000 player_motion.internal.const
execute store result storage player_motion:internal/temp convert.index int 1 run scoreboard players get $bucket_index player_motion.internal.dummy
execute store result score $z player_motion.api.launch run function player_motion:internal/convert_from_legacy/index with storage player_motion:internal/temp convert