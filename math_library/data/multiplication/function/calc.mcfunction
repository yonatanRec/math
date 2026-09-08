
# Multiplication using matrix transformations
# All credit goes to gibbsly for the original implementation, which can be found here:
# https://github.com/gibbsly/gm/blob/main/data/gm/function/multiply.mcfunction


### Input
# a: first number
# b: second number

### Output
# out: storage location for result

# edge cases:
# if a is 0 or b is 0, return 0
$execute store result score #mul_temp temp run function math:equal {a:0, b:$(b)}
$execute if score #mul_temp temp matches 1 run data modify storage $(out) set value 0
execute if score #mul_temp temp matches 1 run return 0

$execute store result score #mul_temp temp run function math:equal {a:$(a), b:0}
$execute if score #mul_temp temp matches 1 run data modify storage $(out) set value 0
execute if score #mul_temp temp matches 1 run return 0

# Build matrix with a in translation X
$data modify storage mathlib:temp mul set value [0f,0f,0f,$(a)d,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f]

# Put b into M33 (bottom-right) using the singleton math entity
$data modify entity 91bb5-0-0-0-ffff transformation set value [0f,0f,0f,1f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,$(b)d]

# Read effective X (which becomes 1 / b)
data modify storage mathlib:temp mul[-1] set from entity 91bb5-0-0-0-ffff transformation.translation[0]

# Load final matrix (a scaled by b)
data modify entity 91bb5-0-0-0-ffff transformation set from storage mathlib:temp mul

# Read result (a * b)
$data modify storage $(out) set from entity 91bb5-0-0-0-ffff transformation.translation[0]