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

#Suppress the explosion kbr resistance trait
attribute @s minecraft:generic.explosion_knockback_resistance modifier add player_motion_disable_kbr -100 add_value