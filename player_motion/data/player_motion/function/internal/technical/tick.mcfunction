#> player_motion:internal/technical/tick
#   Commands run per tick, within a scheduling loop to ensure they're run after any tick.json functions

#If any motion functions were called in the past tick, run the function (this is a measure to enforce proper subtick timing)
execute if score $function_called player_motion.internal.dummy matches 1 as @a[tag=player_motion.launch] at @s run function player_motion:internal/launch/main

schedule function player_motion:internal/technical/tick 1t replace
