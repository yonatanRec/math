scoreboard objectives add temp dummy
scoreboard objectives add custom_value dummy
scoreboard objectives add degrees dummy
scoreboard objectives add calc dummy
scoreboard objectives add scale dummy
scoreboard objectives add count dummy

scoreboard players set #360 custom_value 360
scoreboard players set #180 custom_value 180
scoreboard players set #10 custom_value 10
scoreboard players set #2 custom_value 2
scoreboard players set #1 custom_value 1
scoreboard players set #0 custom_value 0
scoreboard players set #minus_1 custom_value -1
scoreboard players set #max_value custom_value 2147483647
scoreboard players set #min_value custom_value -2147483648


### credit to gibbsly for being the original creator
# link to original: https://github.com/gibbsly/gm - load.mcfunction
# summon a permanent important entity for all functions needing entities
execute unless entity 91bb5-0-0-0-ffff run summon item_display 0 0 0 {UUID:[I;596917,0,0,65535],CustomName:"mathlib calculation entity"}