## Scores
scoreboard objectives add player_motion.api.launch dummy
scoreboard objectives add player_motion.internal.dummy dummy
scoreboard objectives add player_motion.internal.math dummy
    scoreboard objectives add player_motion.internal.math.sqrt dummy
scoreboard objectives add player_motion.internal.const dummy
    scoreboard players set $constant.-1 player_motion.internal.const -1
    scoreboard players set $constant.2 player_motion.internal.const 2
    scoreboard players set $constant.10 player_motion.internal.const 10
    scoreboard players set $constant.12 player_motion.internal.const 12
    scoreboard players set $constant.100 player_motion.internal.const 100
    scoreboard players set $constant.1000 player_motion.internal.const 1000
    scoreboard players set $constant.2000 player_motion.internal.const 2000
    scoreboard players set $constant.8000 player_motion.internal.const 8000
    scoreboard players set $constant.100000 player_motion.internal.const 100000
    scoreboard players set $constant.1000000 player_motion.internal.const 1000000
scoreboard objectives add player_motion.internal.gamemode dummy
scoreboard objectives add player_motion.internal.store dummy
function player_motion:internal/convert_from_legacy/scoreboard_constants

## Forceload
forceload remove 0 0
forceload add 0 0

## Marker
kill d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f
summon marker 0.0 0.0 0.0 {UUID:[I; -725781337, 1317161479, -2007965756, -660627921], Tags:["smithed.strict", "smithed.entity"]}
