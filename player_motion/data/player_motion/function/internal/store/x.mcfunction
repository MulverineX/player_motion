execute \
store result score $x.0 player_motion.internal.store store result score $x.1 player_motion.internal.store store result score $x.2 player_motion.internal.store store result score $x.3 player_motion.internal.store store result score $x.4 player_motion.internal.store \
store result score $x.5 player_motion.internal.store store result score $x.6 player_motion.internal.store store result score $x.7 player_motion.internal.store store result score $x.8 player_motion.internal.store store result score $x.9 player_motion.internal.store \
store result score $x.10 player_motion.internal.store store result score $x.11 player_motion.internal.store store result score $x.12 player_motion.internal.store store result score $x.13 player_motion.internal.store store result score $x.14 player_motion.internal.store \
store result score $x.15 player_motion.internal.store store result score $x.16 player_motion.internal.store store result score $x.17 player_motion.internal.store store result score $x.18 player_motion.internal.store store result score $x.19 player_motion.internal.store \
store result score $x.20 player_motion.internal.store store result score $x.21 player_motion.internal.store store result score $x.22 player_motion.internal.store store result score $x.23 player_motion.internal.store store result score $x.24 player_motion.internal.store \
store result score $x.25 player_motion.internal.store store result score $x.26 player_motion.internal.store store result score $x.27 player_motion.internal.store store result score $x.28 player_motion.internal.store store result score $x.29 player_motion.internal.store \
store result score $x.30 player_motion.internal.store run scoreboard players set $x.31 player_motion.internal.store 0
execute if score $x player_motion.api.launch matches 0 run return 1
execute store success score $x.31 player_motion.internal.store if score $x player_motion.api.launch matches ..-1 run scoreboard players add $x player_motion.api.launch 2147483647
execute store success score $x.30 player_motion.internal.store if score $x player_motion.api.launch matches 1073741824.. run scoreboard players remove $x player_motion.api.launch 1073741824
execute store success score $x.29 player_motion.internal.store if score $x player_motion.api.launch matches 536870912.. run scoreboard players remove $x player_motion.api.launch 536870912
execute store success score $x.28 player_motion.internal.store if score $x player_motion.api.launch matches 268435456.. run scoreboard players remove $x player_motion.api.launch 268435456
execute store success score $x.27 player_motion.internal.store if score $x player_motion.api.launch matches 134217728.. run scoreboard players remove $x player_motion.api.launch 134217728
execute store success score $x.26 player_motion.internal.store if score $x player_motion.api.launch matches 67108864.. run scoreboard players remove $x player_motion.api.launch 67108864
execute store success score $x.25 player_motion.internal.store if score $x player_motion.api.launch matches 33554432.. run scoreboard players remove $x player_motion.api.launch 33554432
execute store success score $x.24 player_motion.internal.store if score $x player_motion.api.launch matches 16777216.. run scoreboard players remove $x player_motion.api.launch 16777216
execute store success score $x.23 player_motion.internal.store if score $x player_motion.api.launch matches 8388608.. run scoreboard players remove $x player_motion.api.launch 8388608
execute store success score $x.22 player_motion.internal.store if score $x player_motion.api.launch matches 4194304.. run scoreboard players remove $x player_motion.api.launch 4194304
execute store success score $x.21 player_motion.internal.store if score $x player_motion.api.launch matches 2097152.. run scoreboard players remove $x player_motion.api.launch 2097152
execute store success score $x.20 player_motion.internal.store if score $x player_motion.api.launch matches 1048576.. run scoreboard players remove $x player_motion.api.launch 1048576
execute store success score $x.19 player_motion.internal.store if score $x player_motion.api.launch matches 524288.. run scoreboard players remove $x player_motion.api.launch 524288
execute store success score $x.18 player_motion.internal.store if score $x player_motion.api.launch matches 262144.. run scoreboard players remove $x player_motion.api.launch 262144
execute store success score $x.17 player_motion.internal.store if score $x player_motion.api.launch matches 131072.. run scoreboard players remove $x player_motion.api.launch 131072
execute store success score $x.16 player_motion.internal.store if score $x player_motion.api.launch matches 65536.. run scoreboard players remove $x player_motion.api.launch 65536
execute store success score $x.15 player_motion.internal.store if score $x player_motion.api.launch matches 32768.. run scoreboard players remove $x player_motion.api.launch 32768
execute store success score $x.14 player_motion.internal.store if score $x player_motion.api.launch matches 16384.. run scoreboard players remove $x player_motion.api.launch 16384
execute store success score $x.13 player_motion.internal.store if score $x player_motion.api.launch matches 8192.. run scoreboard players remove $x player_motion.api.launch 8192
execute store success score $x.12 player_motion.internal.store if score $x player_motion.api.launch matches 4096.. run scoreboard players remove $x player_motion.api.launch 4096
execute store success score $x.11 player_motion.internal.store if score $x player_motion.api.launch matches 2048.. run scoreboard players remove $x player_motion.api.launch 2048
execute store success score $x.10 player_motion.internal.store if score $x player_motion.api.launch matches 1024.. run scoreboard players remove $x player_motion.api.launch 1024
execute store success score $x.9 player_motion.internal.store if score $x player_motion.api.launch matches 512.. run scoreboard players remove $x player_motion.api.launch 512
execute store success score $x.8 player_motion.internal.store if score $x player_motion.api.launch matches 256.. run scoreboard players remove $x player_motion.api.launch 256
execute store success score $x.7 player_motion.internal.store if score $x player_motion.api.launch matches 128.. run scoreboard players remove $x player_motion.api.launch 128
execute store success score $x.6 player_motion.internal.store if score $x player_motion.api.launch matches 64.. run scoreboard players remove $x player_motion.api.launch 64
execute store success score $x.5 player_motion.internal.store if score $x player_motion.api.launch matches 32.. run scoreboard players remove $x player_motion.api.launch 32
execute store success score $x.4 player_motion.internal.store if score $x player_motion.api.launch matches 16.. run scoreboard players remove $x player_motion.api.launch 16
execute store success score $x.3 player_motion.internal.store if score $x player_motion.api.launch matches 8.. run scoreboard players remove $x player_motion.api.launch 8
execute store success score $x.2 player_motion.internal.store if score $x player_motion.api.launch matches 4.. run scoreboard players remove $x player_motion.api.launch 4
execute store success score $x.1 player_motion.internal.store if score $x player_motion.api.launch matches 2.. run scoreboard players remove $x player_motion.api.launch 2
execute if score $x player_motion.api.launch matches 1.. run scoreboard players set $x.0 player_motion.internal.store 1