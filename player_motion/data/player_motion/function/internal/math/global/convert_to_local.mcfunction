scoreboard players operation $_x player_motion.internal.dummy = $x player_motion.internal.dummy
scoreboard players operation $_y player_motion.internal.dummy = $y player_motion.internal.dummy
scoreboard players operation $_z player_motion.internal.dummy = $z player_motion.internal.dummy

execute store result score $x player_motion.internal.dummy run data get storage player_motion:internal/temp vec_i[0] 100000
execute store result score $vec_i.z player_motion.internal.dummy run data get storage player_motion:internal/temp vec_i[2] 100000

execute store result score $y player_motion.internal.dummy run data get storage player_motion:internal/temp vec_j[0] 100000
execute store result score $vec_j.y player_motion.internal.dummy run data get storage player_motion:internal/temp vec_j[1] 100000
execute store result score $vec_j.z player_motion.internal.dummy run data get storage player_motion:internal/temp vec_j[2] 100000

execute store result score $z player_motion.internal.dummy run data get storage player_motion:internal/temp vec_k[0] 100000
execute store result score $vec_k.y player_motion.internal.dummy run data get storage player_motion:internal/temp vec_k[1] 100000
execute store result score $vec_k.z player_motion.internal.dummy run data get storage player_motion:internal/temp vec_k[2] 100000

scoreboard players operation $x player_motion.internal.dummy *= $_x player_motion.internal.dummy
scoreboard players operation $vec_i.z player_motion.internal.dummy *= $_z player_motion.internal.dummy

scoreboard players operation $y player_motion.internal.dummy *= $_x player_motion.internal.dummy
scoreboard players operation $vec_j.y player_motion.internal.dummy *= $_y player_motion.internal.dummy
scoreboard players operation $vec_j.z player_motion.internal.dummy *= $_z player_motion.internal.dummy

scoreboard players operation $z player_motion.internal.dummy *= $_x player_motion.internal.dummy
scoreboard players operation $vec_k.y player_motion.internal.dummy *= $_y player_motion.internal.dummy
scoreboard players operation $vec_k.z player_motion.internal.dummy *= $_z player_motion.internal.dummy

scoreboard players operation $x player_motion.internal.dummy += $vec_i.z player_motion.internal.dummy

scoreboard players operation $y player_motion.internal.dummy += $vec_j.y player_motion.internal.dummy
scoreboard players operation $y player_motion.internal.dummy += $vec_j.z player_motion.internal.dummy

scoreboard players operation $z player_motion.internal.dummy += $vec_k.y player_motion.internal.dummy
scoreboard players operation $z player_motion.internal.dummy += $vec_k.z player_motion.internal.dummy

scoreboard players operation $x player_motion.internal.dummy /= $constant.100000 player_motion.internal.const
scoreboard players operation $y player_motion.internal.dummy /= $constant.100000 player_motion.internal.const
scoreboard players operation $z player_motion.internal.dummy /= $constant.100000 player_motion.internal.const