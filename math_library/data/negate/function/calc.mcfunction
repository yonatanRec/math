#negate:calc


### currently not used, as a better implementation was added to math:negate

### Input
# in: any number

### Output
# out: storage output

# store the input in temporary storage
$data modify storage mathlib:negate temp set value $(in)

# store the sign of the input
data modify storage mathlib:negate sign set string storage mathlib:negate temp 0 1

# check if sign is negative
execute if data storage mathlib:negate {sign:"-"} run data modify storage mathlib:negate temp set string storage mathlib:negate temp 1
execute if data storage mathlib:negate {sign:"-"} run data modify storage mathlib:negate sign2 set value ""

# check if sign is positive
execute unless data storage mathlib:negate {sign:"-"} run data modify storage mathlib:negate sign2 set value "-"

# currently, temp is the absolute value of the input, and sign is the sign of -in
# so now we can put sign and temp together to get the final result
function negate:handle with storage mathlib:negate

# store the result in the output storage
$data modify storage $(out) set from storage mathlib:negate temp