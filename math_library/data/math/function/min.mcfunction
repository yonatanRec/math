# Min function for two numbers


### Input:
# a, b, out

### Output:
# out = min(a, b)

# store inputs
$data modify storage mathlib:min a set value $(a)d
$data modify storage mathlib:min b set value $(b)d

# compare a and b
$execute store result storage mathlib:min bigger int 1 run function math:bigger {a:$(a),b:$(b)}

# if a is bigger, set out to b
$execute if data storage mathlib:min {bigger:1} run data modify storage $(out) set value $(b)d

# if b is bigger, set out to a
$execute if data storage mathlib:min {bigger:0} run data modify storage $(out) set value $(a)d