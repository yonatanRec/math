# Max function for two numbers


### Input:
# a, b, out

### Output:
# out = max(a, b)

# store inputs
$data modify storage mathlib:max a set value $(a)d
$data modify storage mathlib:max b set value $(b)d

# compare a and b
$execute store result storage mathlib:max bigger int 1 run function math:bigger {a:$(a),b:$(b)}

# if a is bigger, set out to a
$execute if data storage mathlib:max {bigger:1} run data modify storage $(out) set value $(a)d

# if b is bigger, set out to b
$execute if data storage mathlib:max {bigger:0} run data modify storage $(out) set value $(b)d