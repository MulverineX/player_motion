#> player_motion:internal/subtick/end_ignore_player
#   Shifts the player back into their normal game mode
#
# Callers:
#   > player_motion:internal/subtick/post_explosion_trigger



#Revert player to previous gamemode
#gamemode adventure @s[scores={player_motion.internal.gamemode=0}]
#gamemode creative @s[scores={player_motion.internal.gamemode=1}]
#gamemode spectator @s[scores={player_motion.internal.gamemode=2}]
#gamemode survival @s[scores={player_motion.internal.gamemode=3}]

tp @s ~ ~-10000 ~

tag @s remove player_motion.ignored_player