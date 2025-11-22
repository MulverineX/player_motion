$execute facing ~$(ix) ~$(jx) ~$(kx) positioned ^ ^ ^$(x) facing ~ ~$(jy) ~$(ky) positioned ^ ^ ^$(y) facing ~$(iz) ~$(jz) ~$(kz) run teleport @s ^ ^ ^$(z)

execute store result score $x player_motion.internal.dummy run data get entity @s Pos[0]
execute store result score $y player_motion.internal.dummy run data get entity @s Pos[1]
execute store result score $z player_motion.internal.dummy run data get entity @s Pos[2]

teleport @s 0.0 0.0 0.0 0.0 0.0