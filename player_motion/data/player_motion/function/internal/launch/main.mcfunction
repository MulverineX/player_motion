#> player_motion:internal/launch/main
# Launches players in the input local direction

execute if entity @s[gamemode=survival] run scoreboard players set $mode player_motion.internal.gamemode 2
execute if entity @s[gamemode=adventure] run scoreboard players set $mode player_motion.internal.gamemode 3

execute unless items entity @s saddle * run item replace entity @s saddle with saddle[equippable={slot: "saddle", equip_sound: {sound_id: ""}}]
item modify entity @s saddle {function: "set_enchantments", add: true, enchantments: {"player_motion:internal/apply_impulse": 1}}

function player_motion:internal/store/x
function player_motion:internal/store/y
function player_motion:internal/store/z

gamemode spectator

execute if score $mode player_motion.internal.gamemode matches 2 store success score $mode player_motion.internal.gamemode run return run gamemode survival

gamemode adventure

execute if score $mode player_motion.internal.gamemode matches 3 store success score $mode player_motion.internal.gamemode run return 1

gamemode creative