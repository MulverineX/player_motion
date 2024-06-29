#> player_motion:internal/subtick/post_explosion_trigger
#   Runs commands as the player immediately after the creeper explosion has been processed
#
# Callers:
#   > player_motion:post_explosion_trigger (advancement)

advancement revoke @s only player_motion:post_explosion_trigger

#Revert player to previous gamemode
gamemode adventure @s[scores={player_motion.internal.gamemode=0}]
gamemode creative @s[scores={player_motion.internal.gamemode=1}]
gamemode spectator @s[scores={player_motion.internal.gamemode=2}]
gamemode survival @s[scores={player_motion.internal.gamemode=3}]

#Revert difficulty if necessary
execute if score $diff player_motion.internal.gamemode matches 0 run difficulty peaceful

#Teleport self down
tp @s ~ ~-1000 ~

#Restore blast protection
execute as @s[tag=player_motion.internal.blastprot] run return 0

execute if score @s player_motion.internal.blastprot.feet matches 1.. run item modify entity @s armor.feet player_motion:blastprot/restore/feet
execute if score @s player_motion.internal.blastprot.legs matches 1.. run item modify entity @s armor.legs player_motion:blastprot/restore/legs
execute if score @s player_motion.internal.blastprot.chest matches 1.. run item modify entity @s armor.chest player_motion:blastprot/restore/chest
execute if score @s player_motion.internal.blastprot.head matches 1.. run item modify entity @s armor.head player_motion:blastprot/restore/head