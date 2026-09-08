#math:asin


# input range: [-1, 1]
# output range: [-90, 90]


### Input:
# in: ratio
# out: storage location

### Output:
# result in storage out

### calculation:
# we need to find cos aswell, because we can find the angle between (0.0,0.0,0.0)
# and (sin(x),0.0,cos(x)), which gives us the final result
# we can find cos using this formula:
# sin^2(x) + cos^2(x) = 1

$execute store result storage mathlib:temp temp int 1 run function math:range/a_-x_-b {a:-1, x:$(in), b:1}
$execute if data storage mathlib:temp {temp:0} run function math:helper/error {message:"asin:calc: input must be in range [-1, 1], input: $(in)"}
execute if data storage mathlib:temp {temp:0} run return fail

$data modify storage mathlib:asin in set value $(in)d

$execute if data storage mathlib:asin {in:1d} run data modify storage $(out) set value 90
execute if data storage mathlib:asin {in:1d} run return 90
$execute if data storage mathlib:asin {in:0.5d} run data modify storage $(out) set value 30
execute if data storage mathlib:asin {in:0.5d} run return 30
$execute if data storage mathlib:asin {in:0d} run data modify storage $(out) set value 0
execute if data storage mathlib:asin {in:0d} run return 0
$execute if data storage mathlib:asin {in:-0.5d} run data modify storage $(out) set value -30
execute if data storage mathlib:asin {in:-0.5d} run return -30
$execute if data storage mathlib:asin {in:-1d} run data modify storage $(out) set value -90
execute if data storage mathlib:asin {in:-1d} run return -90

# so the steps are:
# 1. squaring the input
# 2. subtracting it from 1
# 3. getting the square root
# 4. getting the angle between the specified coordinates

$function math:square {in:$(in), out:"mathlib:asin sin_squared"}

# now 1-sin^2
data modify storage mathlib:temp a set value 1
data modify storage mathlib:temp b set from storage mathlib:asin sin_squared
data modify storage mathlib:temp out set value "mathlib:asin subtraction"
function math:subtract with storage mathlib:temp

# now sqrt(1-sin^2)
data modify storage mathlib:temp in set from storage mathlib:asin subtraction
data modify storage mathlib:temp out set value "mathlib:asin sqrt"
function math:sqrt with storage mathlib:temp

# now we have everything we need
tp 91bb5-0-0-0-ffff 0.0 0.0 0.0
$data modify entity 91bb5-0-0-0-ffff Pos[0] set value $(in)
data modify entity 91bb5-0-0-0-ffff Pos[2] set from storage mathlib:asin sqrt

execute as 91bb5-0-0-0-ffff at @s run tp @s 0.0 0.0 0.0 facing ~ ~ ~
$data modify storage $(out) set from entity 91bb5-0-0-0-ffff Rotation[0]

# the problem is that this gives the negative angle, so we need to get the positive angle by negating the value
data modify storage mathlib:temp in set from entity 91bb5-0-0-0-ffff Rotation[0]
data modify storage mathlib:temp out set value "mathlib:asin neg"
function math:negate with storage mathlib:temp
# now we have the angle in the temp storage location, we just need to store it in the output storage location
$data modify storage $(out) set from storage mathlib:asin neg