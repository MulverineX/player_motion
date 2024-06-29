#> player_motion:internal/technical/load
#   Sets up scores and teams

#Start schedule loops
schedule function player_motion:internal/technical/tick 1t replace

# Definitions for Data-pack Helper Plus
#declare storage player_motion:storage

#SCORES
scoreboard objectives add player_motion.api.launch dummy
scoreboard objectives add player_motion.api.particle dummy
scoreboard objectives add player_motion.internal.dummy dummy
scoreboard objectives add player_motion.internal.gamemode dummy
scoreboard objectives add player_motion.internal.invulnerable dummy
scoreboard objectives add player_motion.internal.math dummy
    scoreboard players set #constant.-1 player_motion.internal.math -1
    scoreboard players set #constant.2 player_motion.internal.math 2
    scoreboard players set #constant.4 player_motion.internal.math 4
    scoreboard players set #constant.16 player_motion.internal.math 16
    scoreboard players set #constant.100 player_motion.internal.math 100
    scoreboard players set #constant.256 player_motion.internal.math 256
    scoreboard players set #constant.1000 player_motion.internal.math 1000
    scoreboard players set #constant.4096 player_motion.internal.math 4096
    scoreboard players set #constant.65793 player_motion.internal.math 65793
scoreboard objectives add player_motion.internal.motion.x dummy
scoreboard objectives add player_motion.internal.motion.y dummy
scoreboard objectives add player_motion.internal.motion.z dummy
scoreboard objectives add player_motion.internal.uuid.0 dummy
scoreboard objectives add player_motion.internal.uuid.1 dummy
scoreboard objectives add player_motion.internal.uuid.2 dummy
scoreboard objectives add player_motion.internal.uuid.3 dummy
scoreboard objectives add player_motion.internal.id dummy
scoreboard objectives add player_motion.internal.x dummy
scoreboard objectives add player_motion.internal.y dummy
scoreboard objectives add player_motion.internal.z dummy
scoreboard objectives add player_motion.internal.blastprot.feet dummy
scoreboard objectives add player_motion.internal.blastprot.legs dummy
scoreboard objectives add player_motion.internal.blastprot.chest dummy
scoreboard objectives add player_motion.internal.blastprot.head dummy


#TEAMS
team add player_motion.no_collide
    team modify player_motion.no_collide collisionRule never


#MARKERS
forceload remove 0 0
forceload add 0 0
kill d59ee2c6-58c8-4885-b9db-ecff066e4439
summon marker ~ ~ ~ {UUID: [I;-711007546,1489520773,-1176769281,107889721],Tags:["smithed.strict","smithed.entity"]}

#STORAGE 
data modify storage player_motion:macros rotation set value {"positive":0,"negative":0}