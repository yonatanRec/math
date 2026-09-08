#math:acos


# input range: [-1, 1]
# output range: [0, 180]


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
$execute if data storage mathlib:temp {temp:0} run function math:helper/error {message:"math:acos: input must be in range [-1, 1], input: $(in)"}
execute if data storage mathlib:temp {temp:0} run return fail

$data modify storage mathlib:acos in set value $(in)d

$execute if data storage mathlib:acos {in:1d} run data modify storage $(out) set value 0
execute if data storage mathlib:acos {in:1d} run return 0
$execute if data storage mathlib:acos {in:0.5d} run data modify storage $(out) set value 60
execute if data storage mathlib:acos {in:0.5d} run return 60
$execute if data storage mathlib:acos {in:0d} run data modify storage $(out) set value 90
execute if data storage mathlib:acos {in:0d} run return 90
$execute if data storage mathlib:acos {in:-1d} run data modify storage $(out) set value 180
execute if data storage mathlib:acos {in:-1d} run return 180
$execute if data storage mathlib:acos {in:-0.5d} run data modify storage $(out) set value 120
execute if data storage mathlib:acos {in:-0.5d} run return 120

# so the steps are:
# 1. squaring the input
# 2. subtracting it from 1
# 3. getting the square root
# 4. getting the angle between the specified coordinates

$function math:square {in:$(in), out:"mathlib:acos cos_squared"}

# now 1-cos^2
data modify storage mathlib:temp a set value 1d
data modify storage mathlib:temp b set from storage mathlib:acos cos_squared
data modify storage mathlib:temp out set value "mathlib:acos subtraction"
function math:subtract with storage mathlib:temp

# now sqrt(1-cos^2)
data modify storage mathlib:temp in set from storage mathlib:acos subtraction
data modify storage mathlib:temp out set value "mathlib:acos sqrt"
function math:sqrt with storage mathlib:temp

# now we have everything we need
tp 91bb5-0-0-0-ffff 0.0 0.0 0.0
$data modify entity 91bb5-0-0-0-ffff Pos[2] set value $(in)
data modify entity 91bb5-0-0-0-ffff Pos[0] set from storage mathlib:acos sqrt

execute as 91bb5-0-0-0-ffff at @s run tp @s 0.0 0.0 0.0 facing ~ ~ ~
# the problem is that this gives the negative angle, so we need to get the positive angle by absolute value
data modify storage mathlib:temp in set from entity 91bb5-0-0-0-ffff Rotation[0]
data modify storage mathlib:temp out set value "mathlib:acos abs"
function math:abs with storage mathlib:temp
# now we have the angle in the temp storage location, we just need to store it in the output storage location
$data modify storage $(out) set from storage mathlib:acos abs