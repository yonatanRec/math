#math:and

### Input:
# a, b

### Output:
# Returns 1 if a and b is true, otherwise returns 0

$data modify storage mathlib:and a set value $(a)
$data modify storage mathlib:and b set value $(b)

execute if data storage mathlib:and {a:1,b:1} run return 1
return 0