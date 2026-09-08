#math:sign

### Input:
# in

### Output:
# Returns 1 if the input is positive, -1 if it is negative, and 0 if it is 0

# safely store the input to a temporary scoreboard
$data modify storage mathlib:sign temp set value $(in)
data modify storage mathlib:sign sign set string storage mathlib:sign temp 0 1

# 0 check
execute if data storage mathlib:sign {temp:0} run return 0

# negative check
execute if data storage mathlib:sign {sign:"-"} run return -1

# if it is not 0 or negative, it must be positive
return 1