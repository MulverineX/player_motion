#> player_motion:internal/summon/summon_creepers_recursive
#   Recursively spawns creepers
#
# Callers:
#   > player_motion:internal/summon_creepers
#
# Inputs:
#   score $creepers_remaining player_motion.internal.math       <<< Number of creepers to spawn
#
# Output:
#   spawns creepers

execute positioned ~ ~1000 ~ summon creeper run function player_motion:internal/summon/initialize_creepers
scoreboard players remove $creepers_remaining player_motion.internal.math 1
execute if score $creepers_remaining player_motion.internal.math matches 1.. run function player_motion:internal/summon/summon_creepers_recursive