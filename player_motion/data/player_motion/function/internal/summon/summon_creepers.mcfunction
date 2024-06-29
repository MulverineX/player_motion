#> player_motion:internal/summon/summon_creepers
#   Summons creepers to launch
#
# Callers:
#   > player_motion:api/launch_looking

scoreboard players operation $creepers_remaining player_motion.internal.math = $creeper_count player_motion.internal.math
$execute rotated ~ ~$(positive) positioned ^ ^ ^-0.01 run function player_motion:internal/summon/summon_creepers_recursive

scoreboard players operation $creepers_remaining player_motion.internal.math = $creeper_count player_motion.internal.math
$execute rotated ~ ~$(negative) positioned ^ ^ ^-0.01 run function player_motion:internal/summon/summon_creepers_recursive