#> player_motion:internal/summon/initialize_creepers
#   Links creepers to players via a scoreboard

data merge entity @s {Tags:["player_motion.launcher"],Silent:1b,Invulnerable:1b,Team:"player_motion.no_collide",ExplosionRadius:-1b,Fuse:0s,PersistenceRequired:1b}
scoreboard players operation @s player_motion.internal.id = $temp player_motion.internal.id