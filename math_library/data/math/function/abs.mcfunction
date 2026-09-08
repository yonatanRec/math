#math:abs

# Absolute value function

### Input: in
### Output: out

# store input
$data modify storage mathlib:abs in set value $(in)d
$data modify storage mathlib:abs out set value "$(out)"


# get the sign
data modify storage mathlib:abs sign set string storage mathlib:abs in 0 1

# if sign is -, remove the -
execute if data storage mathlib:abs {sign:"-"} run data modify storage mathlib:abs in set string storage mathlib:abs in 1

# now store the result inside storage output
return run function test:set_value with storage mathlib:abs