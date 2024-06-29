#> player_motion:internal/subtick/pre_explosion_trigger
#   Runs commands as the player after all other entity processing has occurred and before the explosion has occurred
#
# Callers:
#   > player_motion:pre_explosion_trigger (advancement)

advancement revoke @s only player_motion:pre_explosion_trigger

#Store previous gamemode before switching
scoreboard players set @s[gamemode=adventure] player_motion.internal.gamemode 0
scoreboard players set @s[gamemode=creative] player_motion.internal.gamemode 1
scoreboard players set @s[gamemode=spectator] player_motion.internal.gamemode 2
scoreboard players set @s[gamemode=survival] player_motion.internal.gamemode 3

#Put self in creative so only knockback is applied, no damage
gamemode creative

#Teleport self up
tp @s ~ ~1000 ~

#Store blast protection values & temporarily remove it if present
tag @s remove player_motion.internal.blastprot
execute unless items entity @s armor.* *[enchantments~[{enchantment:"minecraft:blast_protection"}]] run return 0
tag @s add player_motion.internal.blastprot

scoreboard players set @s player_motion.internal.blastprot.feet 0
scoreboard players set @s player_motion.internal.blastprot.legs 0
scoreboard players set @s player_motion.internal.blastprot.chest 0
scoreboard players set @s player_motion.internal.blastprot.head 0

data modify storage player_motion:storage Inventory set from entity @s Inventory

execute if items entity @s armor.feet *[minecraft:enchantments] store result score @s player_motion.internal.blastprot.feet run data get storage player_motion:storage Inventory[{Slot:100b}].components."minecraft:enchantments".levels."minecraft:blast_protection"
execute if items entity @s armor.legs *[minecraft:enchantments] store result score @s player_motion.internal.blastprot.legs run data get storage player_motion:storage Inventory[{Slot:101b}].components."minecraft:enchantments".levels."minecraft:blast_protection"
execute if items entity @s armor.chest *[minecraft:enchantments] store result score @s player_motion.internal.blastprot.chest run data get storage player_motion:storage Inventory[{Slot:102b}].components."minecraft:enchantments".levels."minecraft:blast_protection"
execute if items entity @s armor.head *[minecraft:enchantments] store result score @s player_motion.internal.blastprot.head run data get storage player_motion:storage Inventory[{Slot:103b}].components."minecraft:enchantments".levels."minecraft:blast_protection"

item modify entity @s armor.feet player_motion:blastprot/remove
item modify entity @s armor.legs player_motion:blastprot/remove
item modify entity @s armor.chest player_motion:blastprot/remove
item modify entity @s armor.head player_motion:blastprot/remove