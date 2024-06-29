#> player_motion:internal/subtick/begin_launch_context
#   Sets up the bat and aec used to trigger the player_hurt_entity advancement right before an explosion

function player_motion:internal/subtick/get_player_uuid
execute summon minecraft:area_effect_cloud run function player_motion:internal/subtick/aec_setup
summon minecraft:bat ~ ~ ~ {DeathLootTable:"",NoAI:1b,Health:1.0f,Tags:["player_motion.pre_explosion"],PersistenceRequired:1b}