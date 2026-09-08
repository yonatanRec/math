#math:equal

### Input:
# a, b
### Output:
# Returns 1 if a is equal to b, otherwise returns 0

$data modify storage mathlib:equal a set value $(a)d
$execute if data storage mathlib:equal {a:$(b)d} run return 1
return 0