#log:calc

### Input:
# x: the base
# y: the logarithm input

## conditions:
# x,y > 0
# x != 1

### Output:
# out: storage location for log_x(y)

$data modify storage mathlib:log base set value $(x)d
$data modify storage mathlib:log input set value $(y)d

$execute store result score #temp temp run function math:equal {a:1, b:$(x)}
execute if score #temp temp matches 1 run function math:helper/error {message:"log:calc: log base cannot be 1"}
execute if score #temp temp matches 1 run return fail

$execute store result score #temp temp run function math:range/a_x {a:0, x:$(x)}
execute if score #temp temp matches 0 run function math:helper/error {message:"log:calc: log base must be greater than 0"}
execute if score #temp temp matches 0 run return fail

$execute store result score #temp temp run function math:range/a_x {a:0, x:$(y)}
execute if score #temp temp matches 0 run function math:helper/error {message:"log:calc: log input must be greater than 0"}
execute if score #temp temp matches 0 run return fail

