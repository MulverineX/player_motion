#> player_motion:internal/subtick/end_launch_context
#   Summons the bat and aec used to trigger the player_hurt_entity advancement immediately after an explosion

execute summon minecraft:area_effect_cloud run function player_motion:internal/subtick/aec_setup
summon minecraft:bat ~ ~ ~ {DeathLootTable:"",NoAI:1b,Health:1.0f,Tags:["player_motion.post_explosion"],PersistenceRequired:1b}