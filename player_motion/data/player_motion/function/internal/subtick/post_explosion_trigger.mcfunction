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

#Unsuppress the explosion kbr resistance trait
attribute @s minecraft:generic.explosion_knockback_resistance modifier remove player_motion_disable_kbr