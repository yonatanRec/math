#



### Input:
# a, x - any number values

# returns x=a

$data modify storage mathlib:temp temp set value $(x)d
$execute if data storage mathlib:temp {temp:$(a)d} run return 1
return fail