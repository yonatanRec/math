#math:is_negative

### Input:
# in

### Output:
# returns 1 if the input is negative, and 0 if the input is positive or 0

$data modify storage mathlib:sign temp set value $(in)
data modify storage mathlib:sign sign set string storage mathlib:sign temp 0 1

# negative check
execute if data storage mathlib:sign {sign:"-"} run return 1

# if it is not negative, it must be positive or 0
return 0