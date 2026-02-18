$execute positioned ^$(x) ^$(y) ^ run function player_motion:internal/math/teleport_marker
execute store result score #x player_motion.internal.dummy run data get entity @s Pos[0]
execute store result score #y player_motion.internal.dummy run data get entity @s Pos[2]
teleport @s 0.0 0.0 0.0 0.0 0.0