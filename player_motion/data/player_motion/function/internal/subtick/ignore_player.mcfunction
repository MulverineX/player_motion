#> player_motion:internal/subtick/ignore_player
#   Puts the player into spectator mode while the explosion is occurring
#
# Callers:
#   > player_motion:internal/subtick/pre_explosion_trigger

#Store previous gamemode before switching
#scoreboard players set @s[gamemode=adventure] player_motion.internal.gamemode 0
#scoreboard players set @s[gamemode=creative] player_motion.internal.gamemode 1
#scoreboard players set @s[gamemode=spectator] player_motion.internal.gamemode 2
#scoreboard players set @s[gamemode=survival] player_motion.internal.gamemode 3

#gamemode spectator
tp @s ~ ~10000 ~

tag @s add player_motion.ignored_player