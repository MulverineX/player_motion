#> player_motion:internal/math/arcsin_wrapper
#   Sets up the position context for the arcsin function so it can be ran without forceloading

#data modify entity @s Pos set value [0.0d,0.0d,0.0d]
tp @s 0.0 0.0 0.0
execute at @s run function player_motion:internal/math/arcsin