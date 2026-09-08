#division:calc


# Division using matrix transformations
# All credit goes to gibbsly for the original implementation, which can be found here:
# https://github.com/gibbsly/gm/blob/main/data/gm/function/divide.mcfunction



### Inputs:
# a: numerator
# b: denominator
# out: storage location for result

### edge cases:
# if b = 0, return fail
## else:
# if a = 0, return 0
# if a = b, return 1
$data modify storage mathlib:division a set value $(a)
$data modify storage mathlib:division b set value $(b)
execute if data storage mathlib:division {b:0} run function math:helper/error {message:"division:calc: denominator cannot be zero"}
execute if data storage mathlib:division {b:0} run return fail
$execute if data storage mathlib:division {a:0} run data modify storage $(out) set value 0
execute if data storage mathlib:division {a:0} run return 0

$execute store result score #division temp run function math:equal {a:$(a), b:$(b)}
$execute if score #division temp matches 1 run data modify storage $(out) set value 1
execute if score #division temp matches 1 run return 1

# write the “matrix” into the entity’s transformation
# using T0 = a, M33 = b to exploit Minecraft’s internal division
$data modify entity 91bb5-0-0-0-ffff transformation set value [0f, 0f, 0f, $(a)d, 0f, 1f, 0f, 0f, 0f, 0f, 1f, 0f, 0f, 0f, 0f, $(b)d]

# read X translation → gives a / b
$data modify storage $(out) set from entity 91bb5-0-0-0-ffff transformation.translation[0]

