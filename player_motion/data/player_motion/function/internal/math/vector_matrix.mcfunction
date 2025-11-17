$execute facing ~$(ix) ~$(jx) ~$(kx) run teleport @s ^ ^ ^$(x)
$execute facing ~ ~$(jy) ~$(ky) positioned as @s run teleport @s ^ ^ ^$(y)
$execute facing ~$(iz) ~$(jz) ~$(kz) positioned as @s run teleport @s ^ ^ ^$(z)

execute store result score $x player_motion.internal.dummy run data get entity @s Pos[0]
execute store result score $y player_motion.internal.dummy run data get entity @s Pos[1]
execute store result score $z player_motion.internal.dummy run data get entity @s Pos[2]

tp @s 0.0 0.0 0.0