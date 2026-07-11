# > player_motion:internal/old/math/full_power/sine
$execute store result score $n_full_exp player_motion.internal.old.math run data get storage player_motion:trig arr[$(angle)]
scoreboard players operation $n_full_exp player_motion.internal.old.math *= $motion_y player_motion.internal.old.math
execute store result score $sub_power player_motion.internal.old.math run scoreboard players operation $n_full_exp player_motion.internal.old.math /= #constant.1000 player_motion.internal.const