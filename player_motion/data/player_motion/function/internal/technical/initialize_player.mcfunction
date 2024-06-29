#> player_motion:internal/technical/initialize_player
#   Sets up unique ID for a player

scoreboard players add $global player_motion.internal.id 1
scoreboard players operation @s player_motion.internal.id = $global player_motion.internal.id