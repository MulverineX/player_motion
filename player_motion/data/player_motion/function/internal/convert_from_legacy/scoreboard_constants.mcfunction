#> player_motion:internal/convert_from_legacy/scoreboard_constants.mcfunction
## 
# 32 linear approximation segments for converting from the legacy end crystal method's cubic regression to the current cubic regression.
#
# Cubic regression algorithms generated on [Desmos](https://www.desmos.com/calculator/ocv67a9p3z), newtonian conversion and slope calculations [here](https://discord.com/channels/154777837382008833/1221689674611818556/1439382129304928488)
#
# ```ts
# const BUCKET_PARAMS = [
#     [1012643, 185],  [1011031, 188],  [1008673, 198],
#     [1005570, 216],  [1001722, 247],  [997128, 293],
#     [991788, 357],   [985704, 442],   [978874, 552],
#     [971299, 688],   [962979, 854],   [953914, 1054],
#     [944104, 1289],  [933549, 1564],  [922249, 1880],
#     [910204, 2241],  [897414, 2651],  [883879, 3111],
#     [869600, 3625],  [854575, 4196],  [838806, 4827],
#     [822292, 5520],  [805033, 6280],  [787029, 7108],
#     [768280, 8008],  [748787, 8982],  [728548, 10035],
#     [707565, 11168], [685836, 12385], [663363, 13688],
#     [640144, 15081], [616181, 16567],
# ] as const satisfies Array<[multiplier: number, adder: number]>
# ```
##

# -----------------------------------------------
scoreboard players set $convert.00.multiplier \
    player_motion.internal.const \
    1012643
scoreboard players set $convert.00.adder \
    player_motion.internal.const \
    185
# -----------------------------------------------
scoreboard players set $convert.01.multiplier \
    player_motion.internal.const \
    1011031
scoreboard players set $convert.01.adder \
    player_motion.internal.const \
    188
# -----------------------------------------------
scoreboard players set $convert.02.multiplier \
    player_motion.internal.const \
    1008673
scoreboard players set $convert.02.adder \
    player_motion.internal.const \
    198
# -----------------------------------------------
scoreboard players set $convert.03.multiplier \
    player_motion.internal.const \
    1005570
scoreboard players set $convert.03.adder \
    player_motion.internal.const \
    216
# -----------------------------------------------
scoreboard players set $convert.04.multiplier \
    player_motion.internal.const \
    1001722
scoreboard players set $convert.04.adder \
    player_motion.internal.const \
    247
# -----------------------------------------------
scoreboard players set $convert.05.multiplier \
    player_motion.internal.const \
    997128
scoreboard players set $convert.05.adder \
    player_motion.internal.const \
    293
# -----------------------------------------------
scoreboard players set $convert.06.multiplier \
    player_motion.internal.const \
    991788
scoreboard players set $convert.06.adder \
    player_motion.internal.const \
    357
# -----------------------------------------------
scoreboard players set $convert.07.multiplier \
    player_motion.internal.const \
    985704
scoreboard players set $convert.07.adder \
    player_motion.internal.const \
    442
# -----------------------------------------------
scoreboard players set $convert.08.multiplier \
    player_motion.internal.const \
    978874
scoreboard players set $convert.08.adder \
    player_motion.internal.const \
    552
# -----------------------------------------------
scoreboard players set $convert.09.multiplier \
    player_motion.internal.const \
    971299
scoreboard players set $convert.09.adder \
    player_motion.internal.const \
    688
# -----------------------------------------------
scoreboard players set $convert.10.multiplier \
    player_motion.internal.const \
    962979
scoreboard players set $convert.10.adder \
    player_motion.internal.const \
    854
# -----------------------------------------------
scoreboard players set $convert.11.multiplier \
    player_motion.internal.const \
    953914
scoreboard players set $convert.11.adder \
    player_motion.internal.const \
    1054
# -----------------------------------------------
scoreboard players set $convert.12.multiplier \
    player_motion.internal.const \
    944104
scoreboard players set $convert.12.adder \
    player_motion.internal.const \
    1289
# -----------------------------------------------
scoreboard players set $convert.13.multiplier \
    player_motion.internal.const \
    933549
scoreboard players set $convert.13.adder \
    player_motion.internal.const \
    1564
# -----------------------------------------------
scoreboard players set $convert.14.multiplier \
    player_motion.internal.const \
    922249
scoreboard players set $convert.14.adder \
    player_motion.internal.const \
    1880
# -----------------------------------------------
scoreboard players set $convert.15.multiplier \
    player_motion.internal.const \
    910204
scoreboard players set $convert.15.adder \
    player_motion.internal.const \
    2241
# -----------------------------------------------
scoreboard players set $convert.16.multiplier \
    player_motion.internal.const \
    897414
scoreboard players set $convert.16.adder \
    player_motion.internal.const \
    2651
# -----------------------------------------------
scoreboard players set $convert.17.multiplier \
    player_motion.internal.const \
    883879
scoreboard players set $convert.17.adder \
    player_motion.internal.const \
    3111
# -----------------------------------------------
scoreboard players set $convert.18.multiplier \
    player_motion.internal.const \
    869600
scoreboard players set $convert.18.adder \
    player_motion.internal.const \
    3625
# -----------------------------------------------
scoreboard players set $convert.19.multiplier \
    player_motion.internal.const \
    854575
scoreboard players set $convert.19.adder \
    player_motion.internal.const \
    4196
# -----------------------------------------------
scoreboard players set $convert.20.multiplier \
    player_motion.internal.const \
    838806
scoreboard players set $convert.20.adder \
    player_motion.internal.const \
    4827
# -----------------------------------------------
scoreboard players set $convert.21.multiplier \
    player_motion.internal.const \
    822292
scoreboard players set $convert.21.adder \
    player_motion.internal.const \
    5520
# -----------------------------------------------
scoreboard players set $convert.22.multiplier \
    player_motion.internal.const \
    805033
scoreboard players set $convert.22.adder \
    player_motion.internal.const \
    6280
# -----------------------------------------------
scoreboard players set $convert.23.multiplier \
    player_motion.internal.const \
    787029
scoreboard players set $convert.23.adder \
    player_motion.internal.const \
    7108
# -----------------------------------------------
scoreboard players set $convert.24.multiplier \
    player_motion.internal.const \
    768280
scoreboard players set $convert.24.adder \
    player_motion.internal.const \
    8008
# -----------------------------------------------
scoreboard players set $convert.25.multiplier \
    player_motion.internal.const \
    748787
scoreboard players set $convert.25.adder \
    player_motion.internal.const \
    8982
# -----------------------------------------------
scoreboard players set $convert.26.multiplier \
    player_motion.internal.const \
    728548
scoreboard players set $convert.26.adder \
    player_motion.internal.const \
    10035
# -----------------------------------------------
scoreboard players set $convert.27.multiplier \
    player_motion.internal.const \
    707565
scoreboard players set $convert.27.adder \
    player_motion.internal.const \
    11168
# -----------------------------------------------
scoreboard players set $convert.28.multiplier \
    player_motion.internal.const \
    685836
scoreboard players set $convert.28.adder \
    player_motion.internal.const \
    12385
# -----------------------------------------------
scoreboard players set $convert.29.multiplier \
    player_motion.internal.const \
    663363
scoreboard players set $convert.29.adder \
    player_motion.internal.const \
    13688
# -----------------------------------------------
scoreboard players set $convert.30.multiplier \
    player_motion.internal.const \
    640144
scoreboard players set $convert.30.adder \
    player_motion.internal.const \
    15081
# -----------------------------------------------
scoreboard players set $convert.31.multiplier \
    player_motion.internal.const \
    616181
scoreboard players set $convert.31.adder \
    player_motion.internal.const \
    16567
# -----------------------------------------------