#math:tan


# tangent function

### Input
# in: angle in degrees
# out: storage location for result

### Output
# result inside storage location


### edge cases:
# tan(0) = 0
# tan(45) = 1
# tan(90) = undefined (division by 0)
# tan(135) = -1
# tan(180) = tan(0) = 0

scoreboard players set #tan degrees 30
$execute store success score #tan_temp temp run function test:safe_run {in:"scoreboard players set #tan degrees $(in)"}
scoreboard players operation #tan degrees %= #180 custom_value

# check for 0 edge case
$execute if score #tan degrees matches 0 run data modify storage $(out) set value 0
execute if score #tan degrees matches 0 run return 0

# check for 45 edge case
$execute if score #tan degrees matches 45 run data modify storage $(out) set value 1
execute if score #tan degrees matches 45 run return 1

# check for 90 edge case
$execute if score #tan degrees matches 90 run function math:helper/error {message:"tan:calc: input mod 180 cannot be 90, input: $(in)"}
execute if score #tan degrees matches 90 run return fail

# check for 135 edge case
$execute if score #tan degrees matches 135 run data modify storage $(out) set value -1
execute if score #tan degrees matches 135 run return -1

### calculation:
# tan(x) = sin(x)/cos(x)

# teleport to the correct position (x=sin)
$execute rotated $(in) 0 positioned 0.0 0.0 0.0 positioned ^ ^ ^-1 as 91bb5-0-0-0-ffff run tp @s ~ ~ ~

# store both values
data modify storage mathlib:tan a set from entity 91bb5-0-0-0-ffff Pos[0]
$execute rotated $(in) 0 positioned 0.0 0.0 0.0 positioned ^ ^ ^1 as 91bb5-0-0-0-ffff run tp @s ~ ~ ~
data modify storage mathlib:tan b set from entity 91bb5-0-0-0-ffff Pos[2]

# divide a by b and store to output
$data modify storage mathlib:tan out set value "$(out)"
function math:division with storage mathlib:tan