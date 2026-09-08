#math:cot


# cotgent function

### Input
# in: angle in degrees
# out: storage location for result

### Output
# result inside storage location


### edge cases:
# cot(0) = undefined (division by 0)
# cot(45) = 1
# cot(90) = 0
# cot(135) = -1
# cot(180) = cot(0) = undefined (division by 0)

scoreboard players set #cot degrees 30
$execute store success score #cot_temp temp run function test:safe_run {in:"scoreboard players set #cot degrees $(in)"}
scoreboard players operation #cot degrees %= #180 custom_value

# check for 0 edge case
$execute if score #cot degrees matches 0 run function math:helper/error {message:"math:cot: input mod 180 cannot be 0, input: $(in)"}
execute if score #cot degrees matches 0 run return fail

# check for 45 edge case
$execute if score #cot degrees matches 45 run data modify storage $(out) set value 1
execute if score #cot degrees matches 45 run return 1

# check for 90 edge case
$execute if score #cot degrees matches 90 run data modify storage $(out) set value 0
execute if score #cot degrees matches 90 run return 0

# check for 135 edge case
$execute if score #cot degrees matches 135 run data modify storage $(out) set value -1
execute if score #cot degrees matches 135 run return -1

### calculation:
# cot(x) = sin(x)/cos(x)

# teleport to the correct position (x=sin)
$execute rotated $(in) 0 positioned 0.0 0.0 0.0 positioned ^ ^ ^-1 as 91bb5-0-0-0-ffff run tp @s ~ ~ ~

# store both values
data modify storage mathlib:cot b set from entity 91bb5-0-0-0-ffff Pos[0]
$execute rotated $(in) 0 positioned 0.0 0.0 0.0 positioned ^ ^ ^1 as 91bb5-0-0-0-ffff run tp @s ~ ~ ~
data modify storage mathlib:cot a set from entity 91bb5-0-0-0-ffff Pos[2]

# divide a by b and store to output
$data modify storage mathlib:cot out set value "$(out)"
function math:division with storage mathlib:cot