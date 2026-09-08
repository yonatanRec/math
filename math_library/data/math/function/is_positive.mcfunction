#math:is_positive

### Input:
# in

### Output:
# returns 1 if the input is positive, and 0 if the input is negative or 0

$data modify storage mathlib:sign temp set value $(in)
execute if data storage mathlib:sign {temp:0} run return 0
data modify storage mathlib:sign sign set string storage mathlib:sign temp 0 1

# positive check
execute unless data storage mathlib:sign {sign:"-"} run return 1

# if it is not positive, it must be negative or 0
return 0